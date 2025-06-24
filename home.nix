{ config, pkgs, ... }:

let
  myConfig = import "${toString ./.}/config.nix";
in
{
  imports = [
    ./programs/neovim.nix
    ./programs/tmux.nix
    ./programs/git.nix
    ./programs/zsh.nix
  ];
  home.username = "allens3";
  home.homeDirectory = "/home/allens3";

  home.stateVersion = "25.05";

  home.packages = [
    # Misc utils
    pkgs.fzf
    pkgs.ripgrep

    # Nix development
    pkgs.nixfmt-rfc-style
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
    PAGER = "less -F -X";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  _module.args.me = myConfig.me;
}
