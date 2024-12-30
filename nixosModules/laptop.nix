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

			easyroam_root_ca = {
				format = "binary";
				sopsFile = ../secrets/easyroam_root_ca.pem;
			};

			easyroam_client_cert = {
				format = "binary";
				sopsFile = ../secrets/easyroam_client_cert.pem;
			};

			easyroam_client_key = {
				format = "binary";
				sopsFile = ../secrets/easyroam_client_key.pem;
			};
		};

		networking.wireless = {
			enable = true;
			userControlled.enable = true;
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
				eduroam.auth = ''
					key_mgmt=WPA-EAP
					proto=WPA2
					eap=TLS
					pairwise=CCMP
					group=CCMP
					identity="1122784270474415738@easyroam-pca.uni-duesseldorf.de"
					altsubject_match="DNS:easyroam.eduroam.de"
					ca_cert="${config.sops.secrets.easyroam_root_ca.path}"
					client_cert="${config.sops.secrets.easyroam_client_cert.path}"
					private_key="${config.sops.secrets.easyroam_client_key.path}"
					private_key_passwd=""
				'';
			};
		};

		# Battey settings
		services.tlp = {
			enable = true;
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
