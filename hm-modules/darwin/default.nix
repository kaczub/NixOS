{...}: {
  imports = [
    ./fastfetch.nix
    ./ghostty.nix
    ./packages.nix
  ];

  # HM na macOS nie czyta /etc/profile, więc fish dostaje PATH jawnie.
  # To uzupełnienie nix-darwin programs.fish + homebrew.enableFishIntegration.
  programs.fish.loginShellInit = ''
    fish_add_path --move-to-front /opt/homebrew/bin
    fish_add_path --move-to-front /run/current-system/sw/bin
  '';
}
