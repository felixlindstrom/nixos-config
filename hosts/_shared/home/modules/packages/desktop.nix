{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
    mako
    libnotify
  ];
}
