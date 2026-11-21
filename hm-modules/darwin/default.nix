{...}: {
  imports = [
    ./fastfetch.nix
    ./ghostty.nix
    ./packages.nix
  ];

  # macOS login(1) wypisuje przy starcie terminala "Last login: ... on console".
  # Obecność ~/.hushlogin wyłącza ten komunikat (działa też z fishem).
  home.file.".hushlogin".text = "";

  # HM na macOS nie czyta /etc/profile, więc fish dostaje PATH jawnie.
  # To uzupełnienie nix-darwin programs.fish + homebrew.enableFishIntegration.
  programs.fish.loginShellInit = ''
    fish_add_path --move /opt/homebrew/bin
    fish_add_path --move /run/current-system/sw/bin
  '';
}
