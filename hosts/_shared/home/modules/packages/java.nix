{ pkgs, ... }:
{
  home.packages = [
    pkgs.jetbrains.idea-oss
    pkgs.jdt-language-server
    pkgs.maven
  ];
}
