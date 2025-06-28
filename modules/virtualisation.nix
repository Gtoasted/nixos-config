{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.virtualisation = {
    enable = lib.mkEnableOption "Enable libvirtd (and virt-manager) so you can have virtual machines.";
  };

  config = lib.mkIf config.gtoasted.virtualisation.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        # Required for streaming audio with jack
        package = let
          jackWrap = drv: pkgs.symlinkJoin {
            name = "${drv.name}-jackwrapped";
            paths = [ drv ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              ls "$out/bin"
              for b in "$out/bin/"*; do
                wrapProgram "$b" \
                  --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib"
              done
            '';
        };
        in (jackWrap pkgs.qemu_kvm);
        runAsRoot = false;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    programs.virt-manager.enable = true;
  };
}
