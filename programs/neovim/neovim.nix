{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    defaultEditor = true;

    clipboard = {
      # Use system clipboard in wsl
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    colorschemes.onedark.enable = true;
    diagnostic.settings.virtual_text = true;
    editorconfig.enable = true;
  };
}
