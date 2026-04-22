{ ... }:
let
  onePassPath = "~/.1password/agent.sock";
in
{
  home-manager.users.felix = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*".identityAgent = onePassPath;
    };
  };
}
