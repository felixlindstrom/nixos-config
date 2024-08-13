{ pkgs, ... }:
{
  home.packages = [
    pkgs.blueman
    pkgs.ripgrep
    pkgs.jq
    pkgs.htop
  ];
}
