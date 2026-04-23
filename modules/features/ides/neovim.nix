{ pkgs, ... }:
{
  home-manager.users.felix = {
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
