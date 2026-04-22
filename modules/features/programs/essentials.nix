{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = with pkgs; [
      # Essentials
      python3
      unrar
      unzip
      xz
      zip
      gnumake
      nil
      nixpkgs-fmt

      # Utils
      bat
      iconv
      file
      ripgrep
      jq
      yq
      htop
      xan

      # API clients
      bruno
      bruno-cli
      insomnia

      # Editors
      zed-editor
    ];
  };
}
