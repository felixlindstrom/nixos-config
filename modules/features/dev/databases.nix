{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = with pkgs; [
      mysql80
      (snowflake-cli.overrideAttrs { doInstallCheck = false; })
      postgresql
      google-cloud-sql-proxy
      python313Packages.sqlparse
      pgcli
    ];
  };
}
