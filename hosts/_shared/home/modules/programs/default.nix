{ inputs, ... }:
{
  imports = [
    ./browser.nix
    ./csv.nix
    ./clipboard.nix
    ./databases.nix
    ./dev.nix
    ./git.nix
    ./go.nix
    ./java.nix
    ./neovim.nix
    ./node.nix
    ./rofi.nix
    ./ssh.nix
    ./starship.nix
    ./wezterm.nix
    ./zsh.nix
    ./wm.nix
  ];
}
