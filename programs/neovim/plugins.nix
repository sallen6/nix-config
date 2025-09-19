{ ... }:

{
  programs.nixvim = {
    plugins = {
      autoclose.enable = true;
      comment.enable = true;
      gitblame.enable = true;
      lualine.enable = true;
      web-devicons.enable = true;

      # Unfree
      copilot-vim.enable = true;

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
      
      telescope = {
        enable = true;
        keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>ff" = "find_files find_command=rg,--ignore,--hidden,--files,-g,!.git";
        "<leader>fg" = "live_grep find_command=rg,--ignore,--hidden,--files,-g,!.git";
        "<leader>b" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fd" = "diagnostics";

        # FZF like bindings
        "<C-p>" = "git_files";
        "<leader>p" = "oldfiles";
        "<C-f>" = "live_grep";
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
          nil_ls.enable = true;
          terraformls.enable = true;
          ts_ls = {
            enable = true;
          };
        };
      };
    };
  };
}
