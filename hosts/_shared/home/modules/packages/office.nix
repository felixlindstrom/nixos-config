{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    hunspell
    hunspellDicts.en_US
    hunspellDicts.sv_SE
  ];
}
