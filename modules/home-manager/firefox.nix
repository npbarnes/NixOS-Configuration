{
  programs.firefox = {
    enable = true;
    profiles.default = {
      search = {
        force = true; # force is required. See home-manager documentation.
        default = "ddg"; # DuckDuckGo
      };
    };
    policies = {
      Cookies = {
        Behavior = "reject-tracker-and-partition-foreign";
      };
      DisableFormHistory = true;
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DisplayBookmarksToolbar = "never";

      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      FirefoxHome = {
        Search = true;
        TopSites = true;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };
      FirefoxSuggest = {
        WebSuggestions = true;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };
      HardwareAcceleration = true;
      HttpsOnlyMode = "enabled";
      OfferToSaveLoginsDefault = false;
      PictureInPicture.Enabled = false;
      PopupBlocking.Default = true;
      Preferences = {
        "browser.tabs.warnOnClose" = {
          Value = false;
          Status = "user";
        };
      };
      SearchSuggestEnabled = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = { # uBlock Origin
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "navbar";
          private_browsing = true;
        };
        "jetpack-extension@dashlane.com" = { # Dashlane
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/dashlane/latest.xpi";
          installation_mode = "normal_installed";
          default_area = "navbar";
          private_browsing = true;
        };
        "{2662ff67-b302-4363-95f3-b050218bd72c}" = { # Untrap for Youtube
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/untrap-for-youtube/latest.xpi";
          installation_mode = "normal_installed";
        };
        "{eceab40b-230a-4560-98ed-185ad010633f}" = { # NixOS Packages Search Engine
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4160440/nixos_packages_search_engine-1.0.xpi";
          installation_mode = "normal_installed";
        };
      }; # end ExtensionSettings
    }; # end policies
  }; # end programs.firefox
}
