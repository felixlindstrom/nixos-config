{ pkgs, ... }:
{
  home.packages = [
    pkgs.blueman
    pkgs.ripgrep
    pkgs.jq
    pkgs.yq
    pkgs.htop
  ];
}
