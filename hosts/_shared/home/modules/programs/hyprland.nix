{ pkgs, inputs, config, ... }:
let
  wallpaper = pkgs.fetchurl {
    url = "https://i.redd.it/mvev8aelh7zc1.png";
    hash = "sha256-lJjIq+3140a5OkNy/FAEOCoCcvQqOi73GWJGwR2zT9w";
  };
in
{
  programs.waybar = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
        ",${builtins.toString wallpaper}"
      ];
    };
  };
}
