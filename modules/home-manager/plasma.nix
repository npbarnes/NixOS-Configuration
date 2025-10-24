{
  programs.plasma = {
    enable = true;

    overrideConfig = false;

    configFile = {
      # Focus Follows Mouse (no delay)
      "kwinrc"."Windows"."DelayFocusInterval" = 0;
      "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";

      # Konsole starts on the left half of the screen
      "kwinrulesrc"."General"."count" = 1;
      "kwinrulesrc"."General"."rules" = "a845f3c4-550c-4c2e-a2c3-eccd7141ab5f";
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."Description" = "Application settings for org.kde.konsole";
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."position" = "1113,0";
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."positionrule" = 3;
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."size" = "1113,1208";
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."sizerule" = 3;
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."wmclass" = "konsole org.kde.konsole";
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."wmclasscomplete" = true;
      "kwinrulesrc"."a845f3c4-550c-4c2e-a2c3-eccd7141ab5f"."wmclassmatch" = 1;
    };

    windows.allowWindowsToRememberPositions = true;

    workspace = {
      cursor.size = 18;
      enableMiddleClickPaste = true;
    };

    powerdevil = {
      AC = {
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
        displayBrightness = 100;
        powerButtonAction = "sleep";
        powerProfile = "performance";
        turnOffDisplay.idleTimeout = 60*60; # One hour in seconds
        turnOffDisplay.idleTimeoutWhenLocked = 60*5; # five minutes
        whenSleepingEnter = "standbyThenHibernate";
      };

      battery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 60*30;
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 60*5; # five minutes
        };
        displayBrightness = 90;
        powerButtonAction = "sleep";
        powerProfile = "balanced";
        turnOffDisplay.idleTimeout = 60*15; # fifteen minutes
        turnOffDisplay.idleTimeoutWhenLocked = 60*6; # six minutes
        whenSleepingEnter = "standbyThenHibernate";
      };

      batteryLevels = {
        criticalAction = "hibernate";
        criticalLevel = 3;
        lowLevel = 15;
      };

      general.pausePlayersOnSuspend = true;

      lowBattery = {
        autoSuspend = {
          action = "hibernate";
          idleTimeout = 60*15; # fifteen minutes
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 60; # one minute
        };
        displayBrightness = 70;
        powerButtonAction = "sleep";
        powerProfile = "powerSaving";
        turnOffDisplay.idleTimeout = 60*5; # five minutes
        turnOffDisplay.idleTimeoutWhenLocked = 60*2; # two minutes
        whenSleepingEnter = "standbyThenHibernate";
      };
    };

    kwin = {
      virtualDesktops = {
        number = 4;
        rows = 1;
      };
      effects.desktopSwitching = {
        animation = "off";
        navigationWrapping = false;
      };
      titlebarButtons.left = [
        "more-window-actions"
        "on-all-desktops"
        "keep-above-windows"
      ];
    };

    kscreenlocker = {
      autoLock = false;
      lockOnResume = false;
      timeout = 0;
    };

    panels = [
      # one Windows-like panel at the bottom
      {
        location = "bottom";
        alignment = "center";
        floating = false;
        hiding = "none";
        lengthMode = "fill";
        opacity = "adaptive";
        screen = "all";
        widgets = [
          {
            kickoff = {
              icon = "nix-snowflake";
            };
          }
          {
            pager = {
              general = {
                showWindowOutlines = true;
                showApplicationIconsOnWindowOutlines = true;
                showOnlyCurrentScreen = false;
                selectingCurrentVirtualDesktop = "doNothing";
              };
            };
          }
          {
            iconTasks = {
              iconsOnly = true;
              appearance = {
                fill = true;
                rows = {
                  multirowView = "never";
                };
              };
              behavior = {
                grouping.method = "none";
                sortingMethod = "manually";
                middleClickAction = "none";
                wheel.switchBetweenTasks = false;
              };
              launchers = [
                "preferred://filemanager"
                "preferred://browser"
                "applications:org.kde.konsole.desktop"
                "applications:codium.desktop"
                "applications:steam.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            systemTray.items = {
              shown = [
                "applications:ivpn-ui.desktop"
                "org.kde.plasma.volume"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.battery"
              ];
              hidden = [
                "org.kde.plasma.addons.katesessions"
                "org.kde.plasma.brightness"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.keyboardlayout"
                "org.kde.plasma.weather"
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.mediacontroller"
              ];
            };
          }
          "org.kde.plasma.digitalclock"
        ]; # end widgets
      }
    ]; # end panels
  };
}
