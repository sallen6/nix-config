{
  config,
  pkgs,
  lib,
  ...
}:

let
  myConfig = import "${toString ./.}/config.nix";
in
{
  imports = [
    ./programs/direnv/default.nix
    ./programs/git/default.nix
    ./programs/keychain/default.nix
    ./programs/neovim/default.nix
    ./programs/tmux/default.nix
    ./programs/zoxide/default.nix
    ./programs/zsh/default.nix
  ];
  home.username = "allens3";
  home.homeDirectory = "/home/allens3";

  home.stateVersion = "25.05";

  home.packages = [
    # Misc utils
    pkgs.bat
    pkgs.curl
    pkgs.eza
    pkgs.fzf
    pkgs.htop
    pkgs.jq
    pkgs.pass
    pkgs.ripgrep
    pkgs.tree
    pkgs.unzip
    pkgs.wget
    pkgs.yq
    pkgs.zip

    # Nix development
    pkgs.nixfmt-rfc-style
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = lib.mkDefault "vim";
    PAGER = "less -F -X";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  _module.args.me = myConfig.me;
}
