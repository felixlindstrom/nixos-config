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
    programs.waybar.enable = true;
    programs.hyprlock.enable = true;
    services.hyprpaper = {
      enable = false;
      settings.ipc = "on";
    };
  };
}
