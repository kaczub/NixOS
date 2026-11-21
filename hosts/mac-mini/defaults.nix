{...}: {
  system.defaults = {
    dock = {
      orientation = "bottom";
      autohide = false;
      magnification = true;
      tilesize = 55; # ok. 35% suwaka rozmiaru
      largesize = 61; # ok. 40% suwaka powiększenia
      show-recents = false;
      mineffect = "genie"; # efekt dżina przy pomniejszaniu
      wvous-tl-corner = 2; # lewy górny róg: Mission Control
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
        AppleActionOnDoubleClick = "Maximize"; # dwuklik w pasek okna: wypełnienie
      };
      "com.apple.dock" = {
        "wvous-tl-modifier" = 0; # hot corner bez modyfikatora
        "wvous-tr-corner" = 0; # wyczyść stary hot corner (prawy górny)
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
