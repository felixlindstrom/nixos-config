{ pkgs, ...}:
{
  home.packages = [
    pkgs.jetbrains.idea-community
    pkgs.jdt-language-server
  ];
}
