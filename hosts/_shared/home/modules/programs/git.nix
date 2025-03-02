let
  userName = "Felix Lindstrom";
  email = "felix.lindstrom@gmail.com";
in
{
  programs.git = {
    enable = true;
    userName = userName;
    userEmail = email;
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
