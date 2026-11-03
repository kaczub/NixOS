{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "kaczub";
        email = "170130290+kaczub@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };
}
