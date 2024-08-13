{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprshot
    mako
    libnotify
  ];

  services.mako = {
    enable = true;
    defaultTimeout = 10000;
    ignoreTimeout = true;
  };
}
