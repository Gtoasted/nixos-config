{
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.betterfox.homeManagerModules.betterfox
  ];

  options.gtoasted.firefox = {
    enable = lib.mkEnableOption "Enable firefox.";
  };

  config = lib.mkIf config.gtoasted.firefox.enable {
    stylix.targets.firefox.profileNames = [ "arne" ];
    programs.firefox = {
      enable = true;
      betterfox.enable = true;
      policies = {
        CaptivePortal = false;
        DisableFormHistory = true;
        DontCheckDefaultBrowser = true;
        DisableFirefoxStudies = true;
        DisableTelemetry = true;
        DisablePocket = true;
        OfferToSaveLogins = false;
        HttpsOnlyMode = "enabled";
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
        id = 0;

        betterfox = {
          enable = true;
          enableAllSections = true;
        };

        search = {
          default = "ddg";
          force = true;
          engines =
            let
              define = alias: url: iconURL: {
                urls = [ { template = "https://${url}"; } ];
                icon = "https://${iconURL}";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@${alias}" ];
              };
              nixosIcon = "nixos.wiki/favico.png";
            in
            {
              "Nix Packages" =
                define "nixpkg" "search.nixos.org/packages?channel=unstable&query={searchTerms}"
                  nixosIcon;
              "Nix Options" =
                define "nixopt" "search.nixos.org/options?channel=unstable&query={searchTerms}"
                  nixosIcon;
              "Home Manager Options" =
                define "home" "home-manager-options.extranix.com/?query={searchTerms}&release=master"
                  nixosIcon;
              "Noogle" = define "noogle" "noogle.dev/q?term={searchTerms}" nixosIcon;
              "NüschtOS" = define "nüscht" "search.xn--nschtos-n2a.de/?query={searchTerms}" nixosIcon;

              "google".metaData.hidden = true;
              "bing".metaData.hidden = true;
              "Amazon.de".metaData.hidden = true;
              "ebay".metaData.hidden = true;
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
      };
    };
  };
}
