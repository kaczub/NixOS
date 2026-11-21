{...}: {
  system.defaults = {
    dock = {
      orientation = "left";
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.2; # szybkie wysuwanie
      magnification = true;
      tilesize = 44; # ok. 1/4 suwaka rozmiaru
      largesize = 47; # ok. 1/4 suwaka powiększenia
      show-recents = false;
      mineffect = "scale";
      wvous-tr-corner = 2; # prawy górny róg: Mission Control
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "Nlsv";
      _FXSortFoldersFirst = true;
      FXDefaultSearchScope = "SCcf";
      QuitMenuItem = true;
      CreateDesktop = false;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = false;
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      AppleICUForce24HourTime = true;

      # Wyłącz "inteligentne" zamiany tekstu (kod, terminal, ścieżki).
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
    };

    ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0; # brak akceleracji myszy

    # macOS 27: nowoczesny klucz "Hide items on desktop".
    # finder.CreateDesktop zostaje jako zgodność ze starszymi wersjami.
    WindowManager.StandardHideDesktopIcons = true;

    screencapture.target = "clipboard";

    screensaver.askForPassword = true;

    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleAccentColor = -1; # Graphite
        NSGlassTintAmount = 0.75; # Liquid Glass ~75%
      };
      "com.apple.dock" = {
        "wvous-tr-modifier" = 0; # hot corner bez modyfikatora
      };
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  # Gatekeeper: "Anywhere". Na macOS 27 komenda to --global-disable
  # (--master-disable już nie istnieje).
  system.activationScripts.gatekeeper.text = ''
    spctl --global-disable
    defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool false
  '';

  # Poza Nixem (brak stabilnego klucza / wymaga parowania):
  #   - Apple Watch unlock: System Settings > Login Password / Touch ID & Password
  #   - Control Center: kolejność, rozmiary i "Show When Active" — macOS 27
  #     trzyma to w binarnych blobach (BentoBoxCustomizationState,
  #     bentoboxes.*.plist), więc ustawia się ręcznie.
}
