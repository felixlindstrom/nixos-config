{ config, pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
}
