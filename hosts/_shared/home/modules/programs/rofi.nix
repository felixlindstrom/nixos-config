{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    plugins = with pkgs; [
      (rofi-calc.override { rofi-unwrapped = rofi-unwrapped; })
    ];
    theme = {
      "*" = {
        font-size = "10px";
      };
    };
  };
}
