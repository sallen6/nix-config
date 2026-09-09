{ ... }:

{
  programs.nixvim = {
    plugins = {
      autoclose.enable = true;
      comment.enable = true;
      diffview.enable = true;
      gitblame.enable = true;
      lualine.enable = true;
      oil = {
        enable = true;
        settings.view_options.is_hidden_file.__raw = ''
          function(name, bufnr)
            local dir = require("oil").get_current_dir(bufnr)
            local is_dotfile = vim.startswith(name, ".") and name ~= ".."
            -- No local directory (e.g. ssh), fall back to hiding dotfiles
            if not dir then
              return is_dotfile
            end
            -- Dotfiles are hidden unless they are tracked by git
            return is_dotfile and not OilGitStatus[dir].tracked[name]
          end
        '';
      };
      oil-git-status.enable = true;
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
        "<leader>ff" = "git_files";
        "<leader>fg" = "live_grep hidden=true";
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

    # Per-directory cache of git-tracked files, used by oil's is_hidden_file
    extraConfigLua = ''
      do
        local function parse_output(proc)
          local result = proc:wait()
          local ret = {}
          if result.code == 0 then
            for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
              line = line:gsub("/$", "")
              ret[line] = true
            end
          end
          return ret
        end

        local function new_git_status()
          return setmetatable({}, {
            __index = function(self, key)
              local tracked_proc = vim.system(
                { "git", "ls-tree", "HEAD", "--name-only" },
                { cwd = key, text = true }
              )
              local ret = { tracked = parse_output(tracked_proc) }
              rawset(self, key, ret)
              return ret
            end,
          })
        end

        OilGitStatus = new_git_status()

        -- Clear the cache when oil refreshes a directory
        local refresh = require("oil.actions").refresh
        local orig_refresh = refresh.callback
        refresh.callback = function(...)
          OilGitStatus = new_git_status()
          orig_refresh(...)
        end
      end
    '';
  };
}
