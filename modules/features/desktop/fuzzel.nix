{ pkgs, ... }:
{
  home-manager.users.felix = {
    programs.fuzzel.enable = true;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi;
      plugins = with pkgs; [
        (rofi-calc.override { rofi-unwrapped = rofi-unwrapped; })
      ];
      theme = {
        "*" = {
          font-size = "10px";
        };
      };
    };
  };
}
