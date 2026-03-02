{ pkgs, config, ... }:
{
  imports = [
    # ./kicad.nix
    ./ai.nix
    ./api.nix
    ./chat.nix
    ./cursor.nix
    ./development.nix
    ./ergo.nix
    ./essentials.nix
    ./fonts.nix
    ./insomnia.nix
    ./java.nix
    ./media.nix
    ./notifications.nix
    ./office.nix
    ./organisation.nix
    ./quickshell.nix
    ./screen-record.nix
    ./system.nix
    ./utils.nix
    ./zeditor.nix
  ];
}
