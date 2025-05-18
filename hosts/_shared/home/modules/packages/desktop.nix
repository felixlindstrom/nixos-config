{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
    mako
    libnotify
  ];

  services.mako = {
    enable = true;
    settings = {
      ignore-timeout = true;
      default-timeout = 10000;
    };
  };
}
