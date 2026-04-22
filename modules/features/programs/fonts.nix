{ pkgs, ... }:
{
  home-manager.users.felix = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" "Nerd Fonts Symbols Only" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Inter" "Nerd Fonts Symbols Only" ];
        serif = [ "Inter" "Nerd Fonts Symbols Only" ];
      };
    };

    home.packages = with pkgs; [
      jetbrains-mono
      inter
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      noto-fonts
    ];
  };
}
