{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.xwayland-satellite

    # Needed for Niri, to have working file chooser dialogs.
    pkgs.nautilus

    # pkgs.sunsetr
  ];
}
