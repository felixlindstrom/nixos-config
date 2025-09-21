{ inputs, ... }:
{
  imports = [
    ./browser.nix
    ./clipboard.nix
    ./csv.nix
    ./databases.nix
    ./dev.nix
    ./git.nix
    ./go.nix
    ./java.nix
    ./kicad.nix
    ./neovim.nix
    ./node.nix
    ./rofi.nix
    ./rust.nix
    ./ssh.nix
    ./starship.nix
    ./wezterm.nix
    ./wm.nix
    ./zsh.nix
  ];
}
