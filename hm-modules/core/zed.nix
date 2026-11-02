{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;

    extraPackages = with pkgs; [
      alejandra
      clang-tools
      lua-language-server
      nixd
      pyright
      ruff
    ];

    extensions = ["nix" "lua"];

    userSettings = {
      vim_mode = true;
      theme = "One Dark";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 14;
      format_on_save = "on";
      relative_line_numbers = true;
      autosave.after_delay.milliseconds = 1000;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };
  };
}
