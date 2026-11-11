{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs_22
    pnpm_10
    jdk21
    maven
    terraform
    ssm-session-manager-plugin
    jfrog-cli
    k6
  ];
}
