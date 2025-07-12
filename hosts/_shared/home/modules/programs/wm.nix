{
  programs.waybar = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  services.hyprpaper = {
    enable = false;
    settings = {
      ipc = "on";
    };
  };
}
