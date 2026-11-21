{...}: {
  imports = [
    ../../home.nix
    ../../hm-modules/linux
  ];

  home.homeDirectory = "/home/kamil";
}
