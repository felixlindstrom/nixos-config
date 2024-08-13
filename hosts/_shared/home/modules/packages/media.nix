{ pkgs, ... }: {
  home.packages = with pkgs; [
    playerctl
    pulsemixer
    pavucontrol
    spotify
  ];
}
