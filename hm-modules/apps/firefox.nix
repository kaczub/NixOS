{...}: {
  programs.firefox.enable = true;

  # Stylix target needs to know which Firefox profile to theme.
  # Home Manager's default profile is named "default".
  stylix.targets.firefox.profileNames = [ "default" ];
}
