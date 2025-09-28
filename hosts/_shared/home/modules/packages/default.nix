{ pkgs, config, ... }:
{
  imports = [
    ./api.nix
    ./chat.nix
    ./cursor.nix
    ./development.nix
    ./ergo.nix
    ./essentials.nix
    ./fonts.nix
    ./insomnia.nix
    ./kicad.nix
    ./media.nix
    ./notifications.nix
    ./office.nix
    ./system.nix
    ./utils.nix
  ];
}
