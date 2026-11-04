{ ... }:

{
  programs.nixvim.plugins = {
    # Completion popup. Default preset: <C-y> accept, <C-n>/<C-p> navigate,
    # <C-space> open menu/docs, <C-e> close. Leaves <Tab> free for Copilot.
    blink-cmp = {
      enable = true;
      settings.keymap.preset = "default";
    };

    lsp.keymaps.lspBuf = {
      gd = "definition";
      gD = "declaration";
      gi = "implementation";
      gy = "type_definition";
      "<leader>rn" = "rename";
      "<leader>ca" = "code_action";
    };
  };
}
