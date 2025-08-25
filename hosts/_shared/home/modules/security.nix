{ config, pkgs, ... }:
{
  # Keyring and gpg agent
  services.gnome-keyring.enable = true;
  home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh"; # gnome-keyring
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
  programs.gpg = {
    enable = true;
  };
}
