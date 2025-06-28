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

    # GPU Isolation
    boot = {
      kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
      ];
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = [
        "intel_iommu=on"
        "pcie_acs_override=downstream"
      ];
    };

    # Rip GPU from linux on vm startup
    systemd.tmpfiles.settings = let
      qemu = lib.getExe (pkgs.writeShellScriptBin "qemu" ''
        GUEST_NAME="$1"
        OPERATION="$2"
        SUB_OPERATION="$3"

        # Run commands when the vm is started/stopped.

        if [ "$GUEST_NAME" == "win11" ]; then
          if [ "$OPERATION" == "prepare" ]; then
            if [ "$SUB_OPERATION" == "begin" ]; then
              set -x

              systemctl stop display-manager

              echo 0 > /sys/class/vtconsole/vtcon0/bind
              echo 0 > /sys/class/vtconsole/vtcon1/bind

              echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

              sleep 2

              modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia

              virsh nodedev-detach pci_0000_01_00_0
              virsh nodedev-detach pci_0000_01_00_1

              modprobe vfio-pci
            fi
          fi

          if [ "$OPERATION" == "release" ]; then
            if [ "$SUB_OPERATION" == "end" ]; then
              set -x
              virsh nodedev-reattach pci_0000_01_00_0
              virsh nodedev-reattach pci_0000_01_00_1

              modprobe -r vfio-pci

              echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

              sleep 2

              modprobe nvidia_drm
              modprobe nvidia_modeset
              modprobe nvidia_uvm
              modprobe nvidia

              echo 1 > /sys/class/vtconsole/vtcon0/bind
              echo 1 > /sys/class/vtconsole/vtcon1/bind

              systemctl start display-manager
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
}
