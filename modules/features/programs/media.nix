{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = with pkgs; [
      playerctl
      pulsemixer
      pavucontrol
      spotify
      vlc
    ];
  };
}
