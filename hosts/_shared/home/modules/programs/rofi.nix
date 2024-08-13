{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = {
      "*" = {
        font-size = "10px";
      };
    };
  };
}
