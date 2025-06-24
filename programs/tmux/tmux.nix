{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    escapeTime = 0;
    prefix = "C-a";
    extraConfig = ''
      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind '%'

      # use alt+arrow to move panes without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      set -g default-terminal "screen-256color"
      set -g status-bg black
      set -g status-fg white
    '';
  };
}
