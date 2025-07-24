{ ... }:

{
  # Neovim specific shell aliases
  programs.zsh = {
    shellAliases = {
      # GNU Utils
      cat = "bat -p"; 
      ls = "eza";
      rm = "rm -I";

      # Editor
      nv = "nvim";
      nvfzf = "nvim $(fzf)";

      # Misc
      weather = "curl wttr.in/Philadelphia";
    };
  };
}
