{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.neovim
    pkgs.wezterm
    pkgs.wireplumber
    pkgs.rofi-wayland
    pkgs.hyprpaper
  ];
}
