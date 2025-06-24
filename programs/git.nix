{ config, pkgs, lib, me, ... }:

{
  programs.git = {
    enable = true;

    userName = me.gitUser;
    userEmail = me.email;

    aliases = {
      co = "checkout";
      cob = "checkout -b";
      coo = "!git fetch && git checkout";
      br = "branch"; 
      brd = "branch -d"; 
      brD = "branch -D"; 
      dw = "diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'";
      merged = "branch --merged"; 
      st = "status"; 
      aa = "add -A ."; 
      ap = "add -p ."; 
      cm = "commit -m"; 
      aacm = "!git add -A . && git commit -m"; 
      cp = "cherry-pick"; 
      amend = "commit --amend -m"; 
      dev = "!git checkout dev && git pull origin dev"; 
      staging = "!git checkout staging && git pull origin staging"; 
      main = "!git checkout main && git pull origin "; 
      master = "!git checkout master && git pull origin "; 
      po = "push origin"; 
      pu = "!git push origin `git branch --show-current`"; 
      puf = "!git push origin `git branch --show-current` --force"; 
      pufwl = "!git push origin `git branch --show-current` --force-with-lease"; 
      pom = "push origin main"; 
      poh = "push origin HEAD"; 
      plo = "pull origin"; 
      plom = "pull origin main"; 
      ploh = "pull origin HEAD"; 
      rsh = "!git reset --hard origin/`git branch --show-current`"; 
      rei = "rebase -i";
      unstage = "reset --soft HEAD^"; 
      ls = "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate"; 
      ll = "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"; 
      f = "!git ls-files | grep -i"; 
      gr = "grep -Ii"; 
      la = "!git config -l | grep alias | cut -c 7-;";
    };
  };
}

