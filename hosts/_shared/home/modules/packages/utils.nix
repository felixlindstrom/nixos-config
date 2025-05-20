{ pkgs, ...}:
{
  home.packages = [
    pkgs.bat
    pkgs.iconv
    pkgs.file
  ];
}
