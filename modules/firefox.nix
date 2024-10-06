{ inputs, ... }: {
  home-manager.users."arne" = {
    programs.firefox = {
      enable = true;
      policies = {
        "DisableFirefoxStudies" = true;
        "DisableTelemetry" = true;
        "DisablePocket" = true;
        "Extensions" = {
          "Uninstall" = [
            "google@search.mozilla.org"
            "bing@search.mozilla.org"
            "amazondotcom@search.mozilla.org"
            "ebay@search.mozilla.org"
            "twitter@search.mozilla.org"
          ];
        };
      };

      profiles.arne = {
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
          "beacon.enabled" = false;
          "breakpad.reportURL" = "";
          "browser.aboutConfig.showWarning" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "browser.crashReports.unsubmittedCheck.enabled" = false;
          "browser.newtab.preload" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.enhanced" = false;
          "browser.newtabpage.introShown" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.urlbar.groupLabels.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.trimURLs" = false;
          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.manifest.uri" = "";
          "experiments.supported" = false;
          "extensions.pocket.enabled" = false;
          "media.autoplay.enabled" = false;
          "network.allow-experiments" = false;
          "network.captive-portal-service.enabled" = false;
          # "privacy.donottrackheader.enabled" = true;
          # "privacy.donottrackheader.value" = 1;
          # "privacy.query_stripping" = true;
          # "privacy.resistFingerprinting" = true;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;
          "signon.autofillForms" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.cachedClientID" = "";
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.prompted" = 2;
          "toolkit.telemetry.rejected" = true;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.unifiedIsOptIn" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "browser.bookmarks.addedImportButton" = true;
          "browser.places.importBookmarksHTML" = false;
          "browser.newtabpage.activity-stream.section.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
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
          # multi-account-containers
          # libredirect
        ];
      };
    };
  };
}
