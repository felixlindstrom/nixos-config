{ pkgs, ... }:
{
  home.packages = [
    pkgs.bruno
    pkgs.bruno-cli
  ];
}
