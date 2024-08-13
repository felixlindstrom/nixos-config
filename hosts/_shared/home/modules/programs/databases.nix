{ pkgs, ... }:
{
  home.packages = [
    pkgs.mariadb
    pkgs.postgresql
    pkgs.google-cloud-sql-proxy
  ];
}
