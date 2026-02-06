{ inputs, ... }:
{
  imports = [
    # ./rust.nix
    ./browser.nix
    ./clipboard.nix
    ./csv.nix
    ./databases.nix
    ./dev.nix
    ./fuzzel.nix
    ./git.nix
    ./go.nix
    ./java.nix
    ./neovim.nix
    ./node.nix
    ./rofi.nix
    ./ssh.nix
    ./starship.nix
    ./wezterm.nix
    ./wm.nix
    ./zsh.nix
  ];
}
