{ config, lib, inputs, ... }: {
	imports = [
		inputs.betterfox.homeManagerModules.betterfox
	];

	options.gtoasted.firefox = {
		enable = lib.mkEnableOption "Enable firefox.";
	};

	config = lib.mkIf config.gtoasted.firefox.enable {
		programs.firefox = {
			enable = true;
			betterfox.enable = true;
			policies = {
				DisableFormHistory = true;
				DontCheckDefaultBrowser = true;
				DisableFirefoxStudies = true;
				DisableTelemetry = true;
				DisablePocket = true;
				OfferToSaveLogins = false;
				Extensions = {
					Uninstall = [
						"google@search.mozilla.org"
						"bing@search.mozilla.org"
						"amazondotcom@search.mozilla.org"
						"ebay@search.mozilla.org"
						"twitter@search.mozilla.org"
					];
				};
			};

			profiles.arne = {
				betterfox = {
					enable = true;
					enableAllSections = true;
				};

				search = {
					default = "DuckDuckGo";
					force = true;
					engines = let
						define = alias: url: iconURL: {
							urls = [{template = "https://${url}";}];
							iconUpdateURL = "https://${iconURL}";
							updateInterval = 24 * 60 * 60 * 1000;
							definedAliases = ["@${alias}"];
						};
					in {
						"Youtube" = define "yt" "https://invidious.nerdvpn.de/search?q={searchTerms}" "www.youtube.com/favicon.ico";
						"Nix Packages" = define "nixpkg" "search.nixos.org/packages?query={searchTerms}" "nixos.wiki/favicon.png";
						"Nix Options" = define "nixopt" "search.nixos.org/options?query={searchTerms}" "nixos.wiki/favicon.png";
						"Nix Wiki" = define "nixwiki" "nixos.wiki/index.php?search={searchTerms}" "nixos.wiki/favicon.png";
						"Google".metaData.hidden = true;
						"Bing".metaData.hidden = true;
						"Amazon.de".metaData.hidden = true;
						"eBay".metaData.hidden = true;
						"Twitter".metaData.hidden = true;
					};
				};

				settings = {
					"app.update.auto" = false;
					"extensions.autoDisableScopes" = false;
					"browser.translations.automaticallyPopup" = false;
					"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
					"browser.newtabpage.activity-stream.showSponsored" = false;
				};

				extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
					ublock-origin
					darkreader
					decentraleyes
					i-dont-care-about-cookies
					privacy-possum
					clearurls
					don-t-fuck-with-paste
					enhanced-github
					enhanced-h264ify
					github-file-icons
					keepassxc-browser
					user-agent-string-switcher
					# libredirect
				];
			};
		};
	};
}
