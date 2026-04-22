{ pkgs, ... }:
{
  # System-level
  programs.niri.enable = true;
  environment.systemPackages = [
    pkgs.xwayland-satellite
    pkgs.nautilus
  ];

  # Home-level
  home-manager.users.felix = {
    programs.hyprlock.enable = true;
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        preload = "~/wallpapers/wp3.jpeg";
        wallpaper = ",~/wallpapers/wp3.jpeg";
      };
    };
  };
}
