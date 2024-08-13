{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji" "Nerd Fonts Symbols Only"];
      monospace = ["JetBrainsMono Nerd Font"];
      sansSerif = ["Inter" "Nerd Fonts Symbols Only"];
      serif = ["Inter" "Nerd Fonts Symbols Only"];
    };
  };

  home.packages = [
    pkgs.jetbrains-mono
    pkgs.inter

    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.symbols-only
    pkgs.noto-fonts-emoji
    pkgs.noto-fonts-extra
  ];
}
