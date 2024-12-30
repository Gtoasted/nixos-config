{ config, lib, pkgs, ... }: {
	options.gtoasted.virtualisation= {
		enable = lib.mkEnableOption "Enable libvirtd (and virt-manager) so you can have virtual machines.";
	};

	config = lib.mkIf config.gtoasted.virtualisation.enable {
		virtualisation.libvirtd = {
			enable = true;
			qemu = {
				package = pkgs.qemu_kvm;
				runAsRoot = true;
				swtpm.enable = true;
				ovmf = {
					enable = true;
					packages = [(pkgs.OVMF.override {
						secureBoot = true;
						tpmSupport = true;
					}).fd];
				};
			};
		};
		programs.virt-manager.enable = true;
	};
}
