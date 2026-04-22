{ pkgs, ... }:
{
  # System-level
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.polkit.enable = true;
  programs.seahorse.enable = true;

  # Home-level
  home-manager.users.felix = { config, ... }: {
    services.gnome-keyring.enable = true;
    home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
    services.gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-gnome3;
    };
    programs.gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
      settings = {
        keyserver = "hkp://keys.gnupg.net";
        use-agent = true;
        keyserver-options = "auto-key-retrieve";
        default-key = "DB2D6BB84D8E0309";
      };
    };
    home.packages = [ pkgs.gcr pkgs.polkit_gnome ];
  };
}
