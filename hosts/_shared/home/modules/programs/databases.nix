{ pkgs, ... }:
{
  home.packages = [
    # pkgs.mariadb
    # pkgs.mariadb.client
    pkgs.mysql80
    (pkgs.snowflake-cli.overrideAttrs { doInstallCheck = false; })
    pkgs.postgresql
    pkgs.google-cloud-sql-proxy
    pkgs.python313Packages.sqlparse
  ];
}
