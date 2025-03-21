{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
  };
}
