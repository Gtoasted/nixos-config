{ config, lib, pkgs, ... }: {
	options.gtoasted.laptop = with lib; {
		enable = mkEnableOption "Enable a set of laptop-specific config, including brightness, bluetooth, wifi and battery.";
    secrets = {
      wifi = mkOption {
        example = "/run/secrets/wifi";
        type = types.str;
        description = "Path to wpa-supplicant secrets file.";
      };
      easyroam = mkOption {
        type = types.str;
        description = "Path to pkcs file for easyroam setup.";
      };
    };
	};

	config = let cfg = config.gtoasted.laptop; in lib.mkIf cfg.enable {
    # Screen Rotation
    hardware.sensor.iio.enable = true;

		# Brightness
		environment.systemPackages = with pkgs; [
			brightnessctl
		];

		# Bluetooth
		hardware.bluetooth.enable = true;
		hardware.bluetooth.powerOnBoot = true;
		services.blueman.enable = true;

    # Battery
    services.upower = {
      enable = true;
    };

		# Wifi
		networking.wireless = {
			enable = true;
			userControlled.enable = true;
      fallbackToWPA2 = false;
      secretsFile = cfg.secrets.wifi;
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
      pkcsFile = cfg.secrets.easyroam;
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
