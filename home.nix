{ config, pkgs, ... }:

{
  imports = [
    ./programs/nixvim.nix
  ];
  home.username = "allens3";
  home.homeDirectory = "/home/allens3";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.fzf
    pkgs.git
    pkgs.ripgrep
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
