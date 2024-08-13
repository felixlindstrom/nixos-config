{ ... }:
{
  imports = [
    ../../_shared/home
  ];

  xdg.configFile."hypr-local/additional.conf".source = "${../config}/hypr/additional.conf";
}
