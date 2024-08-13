{ pkgs, ... }:
{
  home.packages = [
    pkgs.mysql
    pkgs.postgresql
    pkgs.google-cloud-sql-proxy
  ];
}
