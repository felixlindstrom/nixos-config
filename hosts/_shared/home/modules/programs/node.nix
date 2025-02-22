{ pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.xan
  ];
}
