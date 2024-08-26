{ ... }:
{
  programs.thunderbird = {
    enable = true;
    mail = {
      defaultClient = true;
      defaultClientMailto = true;
    };
  };
}
