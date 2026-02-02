{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "avit";
    };
    # Add ~/
    initExtra = ''
      export PATH="/home/allens3/.local/bin:$PATH"
    '';
  };
}
