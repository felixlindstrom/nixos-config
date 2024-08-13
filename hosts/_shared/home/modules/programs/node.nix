{ pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.xsv
  ];
}
