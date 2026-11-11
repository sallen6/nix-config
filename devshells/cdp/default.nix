{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs_22
    pnpm_10
    jdk21
    maven
    terraform
    awscli2
    ssm-session-manager-plugin
    gh
    jfrog-cli
    k6
    # Wrapped so yq's Python doesn't shadow the system python3, whose user site-packages
    # provide the docker-compose library used by scripts/util/generate-compose-config.py.
    (writeShellScriptBin "yq" ''exec ${yq}/bin/yq "$@"'')
  ];
}
