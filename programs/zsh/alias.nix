{ ... }:

{
  programs.zsh = {
    shellAliases = {
      # GNU Utils
      cat = "bat -p"; 
      ls = "eza -1 --group-directories-first";
      mkdir = "mkdir -pv";
      rm = "rm -I";

      # Misc
      weather = "curl wttr.in/Philadelphia";
    };
  };
}
