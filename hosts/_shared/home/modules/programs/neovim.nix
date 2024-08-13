{ pkgs, inputs, config, ... }:
let
  mkooss = config.lib.file.mkOutOfStoreSymlink;
  linkConfig = filePath: mkooss "${config.home.homeDirectory}/Projects/nixos-config/config/${filePath}"; # Change this to be relative..
  dotconf = linkConfig "nvim";
in
{
  xdg.configFile."nvim".source = dotconf;
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc
      curl
      clang
      fzf
      gnumake


      lua-language-server
      nil
      stylua
      nodePackages_latest.prettier
      nodePackages_latest.jsonlint
      yamllint

      nodePackages_latest.pyright
    ];
  };
}
