{ pkgs, ... }: {
  programs.kitty.enable = true;
  programs.ghostty.enable = true;
  programs.wezterm = {
    enable = true;
  };
}
