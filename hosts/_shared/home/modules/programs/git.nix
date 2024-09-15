let
  userName = "Felix Lindstrom";
  email = "felix.lindstrom@gmail.com";
in
{
  programs.git = {
    enable = true;
    userName = userName;
    userEmail = email;
  };
}
