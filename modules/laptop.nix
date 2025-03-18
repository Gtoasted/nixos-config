{ config, lib, pkgs, ... }: {
	options.gtoasted.laptop = {
		enable = lib.mkEnableOption "Enable a set of laptop-specific config, including brightness, bluetooth, wifi and battery.";
	};

	config = lib.mkIf config.gtoasted.laptop.enable {
		# Brightness
		environment.systemPackages = with pkgs; [
			brightnessctl
		];

		# Bluetooth
		hardware.bluetooth.enable = true;
		hardware.bluetooth.powerOnBoot = true;
		services.blueman.enable = true;

		# Wifi
		sops.secrets = {
			wifi = {
				format = "binary";
				sopsFile = ../secrets/wifi;
			};

      easyroam = {
        format = "binary";
        sopsFile = ../secrets/easyroam;
      };
		};

		networking.wireless = {
			enable = true;
			userControlled.enable = true;
      fallbackToWPA2 = false;
			secretsFile = config.sops.secrets.wifi.path;
			networks = {
				Sagittarius.pskRaw = "ext:sagittarius";
				Gommemode.pskRaw = "ext:gommemode";
				G96.pskRaw = "ext:g96";
				LambdaAufDemEFeld.pskRaw = "ext:lambdaaufdemefeld";
				"The promised LAN".pskRaw = "ext:thepromisedlan";
				"Vodafone-5AE1".pskRaw = "ext:vodafone5ae1";
				"Gastzugang Marienhof".pskRaw = "ext:gastzugangmarienhof";
				PilogLisa.pskRaw = "ext:piloglisa";
        "HHUD-Y".pskRaw = "ext:hhud-y";
        "AAD-WLAN".pskRaw = "ext:aad-wlan";
			};
		};

    services.easyroam = {
      enable = true;
      pkcsFile = "${config.sops.secrets.easyroam.path}";
      wpa-supplicant.enable = true;
    };

		# Battey settings
		services.tlp = {
			enable = !config.services.power-profiles-daemon.enable;
			settings = {
				CPU_SCALING_GOVERNOR_ON_AC = "performance";
				CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

				CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
				CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

				CPU_MIN_PERF_ON_AC = 0;
				CPU_MAX_PERF_ON_AC = 100;
				CPU_MIN_PERF_ON_BAT = 0;
				CPU_MAX_PERF_ON_BAT = 20;
			};
		};
	};
}
