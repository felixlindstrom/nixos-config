{ pkgs, ... }:
{
  home.packages = [
    # pkgs.mariadb
    # pkgs.mariadb.client
    pkgs.mysql80
    pkgs.postgresql
    pkgs.google-cloud-sql-proxy
  ];
}
