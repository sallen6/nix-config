{
  lib,
  ...
}:

{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps =
      let
        normal =
          lib.mapAttrsToList
            (key: action: {
              mode = "n";
              inherit action key;
            })
            {
              # Sensible pane navigation
              "<C-h>" = "<C-w>h";
              "<C-j>" = "<C-w>j";
              "<C-k>" = "<C-w>k";
              "<C-l>" = "<C-w>l";

              # Diffview
              "<leader>d" = "<CMD>:DiffviewOpen<CR>";
              "<leader>dq" = "<CMD>:DiffviewClose<CR>";

              # Gitsigns
              "<leader>gj" = "<CMD>:Gitsigns nav_hunk next<CR>";
              "<leader>gk" = ":Gitsigns nav_hunk prev<CR>";

              # Oil
              "-" = ":Oil<CR>";
              "<leader>v" = "<CMD>vsplit | :Oil<CR>";
              "<leader>s" = "<CMD>split | :Oil<CR>";
            };
        visual =
          lib.mapAttrsToList
            (key: action: {
              mode = "v";
              inherit action key;
            })
            {
              # sort
              "<leader>s" = ":sort<CR>";
            };
      in
      normal ++ visual;
  };
}
