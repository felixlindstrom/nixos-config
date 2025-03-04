{ inputs, ... }:
{
  imports = [
    ./browser.nix
    ./csv.nix
    ./clipboard.nix
    ./databases.nix
    ./email.nix
    ./git.nix
    ./go.nix
    ./hyprland.nix
    ./java.nix
    ./neovim.nix
    ./node.nix
    ./rofi.nix
    ./ssh.nix
    ./starship.nix
    ./wezterm.nix
    ./zsh.nix
  ];
  programs.home-manager.enable = true;
}
