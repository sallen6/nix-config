{
  config,
  pkgs,
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
