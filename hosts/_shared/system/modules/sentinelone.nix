{ pkgs, inputs, ... }:
{
  imports = [
    inputs.sentinelone.nixosModules.sentinelone
  ];
  services.sentinelone = {
    enable = true;
    sentinelOneManagementTokenPath = "/home/felix/sentinelone.txt";
    email = "felix.lindstrom@instabox.se";
    serialNumber = "PC1DBWNE";
  };
}
