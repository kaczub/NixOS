{...}: {
  # Automatyczne ładowanie środowisk per katalog.
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
