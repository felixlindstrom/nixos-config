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
    ./neovim.nix
    ./node.nix
    ./rofi.nix
    ./ssh.nix
    ./rust.nix
    ./starship.nix
    ./wezterm.nix
    ./wm.nix
    ./zsh.nix
  ];
}
