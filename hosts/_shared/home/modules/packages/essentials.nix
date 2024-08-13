
{ pkgs, ... }:
{
  home.packages = [
    pkgs.python3

    # Archiving
    pkgs.unrar
    pkgs.unzip
    pkgs.xz
    pkgs.zip
  ];
}
