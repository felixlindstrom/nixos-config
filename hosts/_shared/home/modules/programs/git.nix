{
  programs.git = {
    enable = true;
    extraConfig = {
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com";
        };
      };
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
