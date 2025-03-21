{
  pkgs,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
  niri-session = "${pkgs.niri}/share/wayland-sessions";
in {
  # services.xserver.displayManager.gdm.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --sessions ${niri-session}";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
