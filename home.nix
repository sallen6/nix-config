{ config, pkgs, ... }:

let
  myConfig = import "${toString ./.}/config.nix";
in
{
  imports = [
    ./programs/nixvim.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/zsh.nix
  ];
  home.username = "allens3";
  home.homeDirectory = "/home/allens3";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.fzf
    pkgs.ripgrep
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  _module.args.me = myConfig.me;
}

