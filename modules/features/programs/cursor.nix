{ pkgs, ... }:
let
  cursorPackage = pkgs.vanilla-dmz;
  cursorName = "DMZ-Black";
  cursorSize = 24;
in
{
  home-manager.users.felix = {
    home.pointerCursor = {
      x11.enable = true;
      gtk.enable = true;
      name = cursorName;
      package = cursorPackage;
      size = cursorSize;
    };
    gtk.cursorTheme = {
      package = cursorPackage;
      name = cursorName;
      size = cursorSize;
    };
  };
}
