{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
      insertNameservers = [
        "1.1.1.1"
        "8.8.8.8"
        "100.100.100.100"
      ];
    };
    useDHCP = false;
    dhcpcd.enable = false;

    nameservers = [
      "100.100.100.100"
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--operator=felix"
      "--accept-routes=true"
    ];
  };
}
