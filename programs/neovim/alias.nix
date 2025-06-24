{ config, pkgs, ... }:

{
  # Neovim specific shell aliases
  programs.zsh = {
    shellAliases = {
      nv = "nvim";
      nvfzf = "nvim $(fzf)";
    };
  };
}
