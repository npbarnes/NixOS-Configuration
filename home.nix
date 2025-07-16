{ config, pkgs, ... }:
{
  home.username = "npbarnes";
  home.homeDirectory = "/home/npbarnes";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = { };

  programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.enableUpdateCheck = true;
    profiles.default.enableExtensionUpdateCheck = true;
  };

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
      DisableAccounds = true;
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
      }; # end ExtensionSettings
    }; # end policies
  }; # end programs.firefox

  programs.git = {
    enable = true;
    userName = "Nathan Barnes";
    userEmail = "nathanpaulbarnes@gmail.com";
    ignores = [ "*.swp" ];
    extraConfig = {
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "main";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      commit.verbose = true;
      merge.conflictstyle = "zdiff3";
    };
  };
}
