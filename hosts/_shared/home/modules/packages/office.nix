{ pkgs, ... }:
{
  home.packages = width pkgs; [
    libreoffice
    hunspell
    hunspellDicts.en_US
    hunspellDicts.sv_SE
  ];
}
