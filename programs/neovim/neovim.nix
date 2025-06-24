{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    colorschemes.onedark.enable = true;
    diagnostic.settings.virtual_text = true;
    editorconfig.enable = true;

    plugins = {
      autoclose.enable = true;
      lualine.enable = true;

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };
      treesitter = {
        enable = true;
        autoLoad = true;
      };

      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          bashls.enable = true;
          terraformls.enable = true;
          ts_ls = {
            enable = true;
          };
        };
      };
    };
  };
}
