{config, ...}: {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    download = "${config.home.homeDirectory}/Pobrane";
    documents = "${config.home.homeDirectory}/Dokumenty";
    pictures = "${config.home.homeDirectory}/Obrazy";
    videos = "${config.home.homeDirectory}/Filmy";
    music = "${config.home.homeDirectory}/Muzyka";
  };
}
