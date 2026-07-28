{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    userSettings = {
      "workbench.editor.empty.hint" = "hidden";
      "chat.viewSessions.orientation" = "stacked";
      "workbench.iconTheme" = "vscode-icons";
      "explorer.confirmDelete" = false;
      "workbench.colorTheme" = "Adwaita Dark";
      "liveServer.settings.donotShowInfoMsg" = true;

      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;

      "nix.serverSettings" = {
        "nixd" = {
          "nixpkgs" = {
            "expr" = "import <nixpkgs> {}";
          };
          "options" = {
            "nixos" = {
              "expr" = "(import <nixpkgs/nixos> { configuration = /home/kamil/nixos/configuration.nix; }).options";
            };
          };
          "formatting" = {
            "command" = [
              "alejandra"
            ];
          };
        };
      };

      "makefile.configureOnOpen" = true;
    };
  };
}
