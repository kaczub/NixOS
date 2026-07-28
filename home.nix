{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "kamil";
    homeDirectory = "/home/kamil";

    stateVersion = "26.11";
  };
}