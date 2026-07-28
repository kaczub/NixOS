{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      jnoortheen.nix-ide
      vscode-icons-team.vscode-icons
      ms-vscode.makefile-tools
      ritwickdey.liveserver
    ];

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
