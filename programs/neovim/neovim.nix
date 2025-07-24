{ ... }:

{
  programs.nixvim = {
    enable = true;

    nixpkgs.config.allowUnfree = true; 

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
