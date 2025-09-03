{ config, pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.polkit.enable = true;
  programs.seahorse.enable = true;

}
