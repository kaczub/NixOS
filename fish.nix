{pkgs, ...}: {
  programs.fish = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    fishPlugins.hydro
  ];

  # 3. Inteligentna nawigacja zoxide
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # 4. Wyszukiwarka fzf
  programs.fzf = {
    fuzzyCompletion = true;
    keybindings = true;
  };
}
