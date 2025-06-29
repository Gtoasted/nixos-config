{ config, lib, pkgs, ...}: {
  options.gtoasted.gpu-passthrough = {
    enable = lib.mkEnableOption "Enable ";
  };

  config = lib.mkIf config.gtoasted.gpu-passthrough.enable {
    # Audio
    security.rtkit.enable = true;
    services.pipewire.systemWide = true;
    users.users.arne.extraGroups = [ "pipewire" ];
    users.users.root.extraGroups = [ "pipewire" ];
    users.users.qemu-libvirtd.extraGroups = [ "pipewire" ];

    # Isolate GPU at boot
    boot = {
      kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
        # "vfio_virqfd"
        #
        # "nvidia"
        # "nvidia_modeset"
        # "nvidia_uvm"
        # "nvidia_drm"
      ];
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = [
        "intel_iommu=on"
        "pcie_acs_override=downstream"
        # "vfio-pci.ids=10de:1b81,10de:10f0"
      ];
    };

    # Attach GPU after boot
    systemd = let
      rmmod = "${pkgs.kmod}/bin/rmmod";
      modprobe = "${pkgs.kmod}/bin/modprobe";
      attachgpu = /*bash*/ ''
        ${rmmod} vfio_pci vfio_pci_core vfio_iommu_type1 vfio
        ${modprobe} nvidia_drm modeset=1 fbdev=0
        ${modprobe} nvidia nvidia_modeset nvidia_uvm 
        echo -n "0000:01:00.1" > /sys/bus/pci/drivers/snd_hda_intel/bind
      '';
    in {
      services.attach-gpu = {
        description = "Attach GPU after boot";
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "simple";
          User = "root";
          RemainAfterExit = true;
          ExecStart = lib.getExe (pkgs.writeShellScriptBin "attachgpu" attachgpu);
        };
      };

      # Rip GPU from linux on vm startup
      tmpfiles.settings = let
        lsof = pkgs.lsof;
        qemu = lib.getExe (pkgs.writeShellScriptBin "qemu" ''
          GUEST_NAME="$1"
          OPERATION="$2"
          SUB_OPERATION="$3"

          # Run commands when the vm is started/stopped.

          if [ "$GUEST_NAME" == "win11" ]; then
            if [ "$OPERATION" == "prepare" ]; then
              if [ "$SUB_OPERATION" == "begin" ]; then
                udevadm trigger --action=remove /dev/dri/card1
                systemctl --user --machine=arne@ stop plasma-powerdevil
                ${lsof} /dev/nvidia0 | awk '{print $2}' | xargs -I {} kill {}
                ${lsof} /dev/dri/card1 | awk '{print $2}' | xargs -I {} kill {}
                ${lsof} /dev/dri/renderD129 | awk '{print $2}' | xargs -I {} kill {}
                sleep 5s #allow graceful shutdown
                #if still alive
                ${lsof} /dev/nvidia0 | awk '{print $2}' | xargs -I {} kill -9 {}
                ${lsof} /dev/dri/card1 | awk '{print $2}' | xargs -I {} kill -9 {}
                ${lsof} /dev/dri/renderD129 | awk '{print $2}' | xargs -I {} kill -9 {}
                sleep 2s #prevent unloading breaking
                rmmod nvidia_drm
                rmmod nvidia_modeset
                rmmod nvidia_uvm
                rmmod nvidia
                modprobe vfio_pci ids=10de:2482,10de:228b 
                modprobe vfio_pci_core vfio_iommu_type1 vfio
              fi
            fi

            if [ "$OPERATION" == "release" ]; then
              if [ "$SUB_OPERATION" == "end" ]; then
                ${attachgpu}
              fi
            fi
          fi
        '');
      in {
        "10-libvirt-hook" = {
          "/var/lib/libvirt/hooks/qemu".L = {
            argument = qemu;
          };
        };
      };
    };
  };
}
