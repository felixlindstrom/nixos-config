{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = [
    pkgs.neovim
    pkgs.wezterm
    pkgs.wireplumber
    pkgs.rofi-wayland
    pkgs.hyprpaper
    pkgs.pinentry-curses
  ];
}
