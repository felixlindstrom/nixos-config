{ pkgs, ...}:
{
  home.packages = [
    pkgs.bambu-studio
    pkgs.orca-slicer
  ];
}
