{ ... }:

{
  # Neovim specific shell aliases
  programs.zsh = {
    shellAliases = {
      nv = "nvim";
      nvf = "nvim $(fzf)";
      nvfzf = "nvim $(fzf)";
      vim = "nvim";

      # Default model workaround
      claude = "claude --model opus";
    };
  };
}
