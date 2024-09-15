{ inputs, ... }:
{
  imports = [
    ./chromium.nix
    ./clipboard.nix
    ./databases.nix
    ./email.nix
    ./git.nix
    ./hyprland.nix
    ./java.nix
    ./neovim.nix
    ./node.nix
    ./rofi.nix
    ./ssh.nix
    ./starship.nix
    ./vscode.nix
    ./wezterm.nix
    ./zsh.nix
  ];
  programs.home-manager.enable = true;
}
