{ ... }:
{
  services.sentinelone = {
    enable = true;
    sentinelOneManagementTokenPath = ./token.txt;
    email = "felix.lindstrom@instabox.se";
    serialNumber = "PC1DBWNE";
    package = pkgs.sentinelone.overrideAttrs (old: {
      version = "25.1.2.17"; 
    });
  };
}
