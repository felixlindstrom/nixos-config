{ pkgs, ... }:
{
  home-manager.users.felix = { config, ... }:
  let
    mkooss = config.lib.file.mkOutOfStoreSymlink;
    linkConfig = filePath: mkooss "${config.home.homeDirectory}/Projects/nixos-config/config/${filePath}";
  in
  {
    xdg.configFile."nvim".source = linkConfig "nvim";
    programs.neovim = {
      enable = true;
      extraPackages = with pkgs; [
        gcc
        curl
        clang
        fzf
        gnumake
        vscode-langservers-extracted
        lua-language-server
        nil
        stylua
        vtsls
        nodePackages_latest.prettier
        yamllint
        helm-ls
      ];
    };
    programs.ruff = {
      enable = true;
      settings = { };
    };
  };
}
