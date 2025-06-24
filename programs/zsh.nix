{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true; 
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "amuse";
    };
  };
}
