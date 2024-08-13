{ ... }:
{
  virtualisation.docker = {
    enable = true;
  };
  users.users.felix.extraGroups = [ "docker" ];
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
}
