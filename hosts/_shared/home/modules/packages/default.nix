{ pkgs, config, ... }:
{
  imports = [
    ./api.nix
    ./chat.nix
    ./cursor.nix
    ./desktop.nix
    ./development.nix
    ./ergo.nix
    ./essentials.nix
    ./fonts.nix
    ./insomnia.nix
    ./media.nix
    ./office.nix
    ./system.nix
  ];
}
