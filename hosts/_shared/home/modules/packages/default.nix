{ pkgs, config, ... }:
{
  imports = [
    ./api.nix
    ./chat.nix
    ./cursor.nix
    ./notifications.nix
    ./development.nix
    ./ergo.nix
    ./essentials.nix
    ./fonts.nix
    ./insomnia.nix
    ./media.nix
    ./office.nix
    ./system.nix
    ./utils.nix
  ];
}
