{ ... }:

let
  thisDir = ./.;
  files = builtins.readDir thisDir;
  nixFiles = builtins.filter
    (name: name != "default.nix" && builtins.match ".*\.nix$" name != null)
    (builtins.attrNames files);
  imports = map (name: import (thisDir + "/${name}")) nixFiles;
in
{
  imports = imports;
}
