{ pkgs, config, ... }:
{
  imports = [
    ./api.nix
    ./zeditor.nix
    ./chat.nix
    ./cursor.nix
    ./development.nix
    ./ergo.nix
    ./essentials.nix
    ./fonts.nix
    ./insomnia.nix
    ./java.nix
    # ./kicad.nix
    ./media.nix
    ./notifications.nix
    ./office.nix
    ./organisation.nix
    ./quickshell.nix
    ./system.nix
    ./utils.nix
  ];
}
