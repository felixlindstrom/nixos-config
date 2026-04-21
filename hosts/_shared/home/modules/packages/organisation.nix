{ pkgs, ... }:
{
  home.packages = [
    pkgs.obsidian
    pkgs.wf-recorder
    pkgs.slurp
    pkgs.vlc
  ];
}
