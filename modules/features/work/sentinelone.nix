{ inputs, config, ... }:
{
  imports = [
    inputs.sentione.nixosModules.default
  ];
  services.sentinelone = {
    enable = false;
    tokenFile = config.sops.secrets.sentinelone_token.path;
    customerIdFile = config.sops.secrets.sentinelone_customer_id.path;
  };
}
