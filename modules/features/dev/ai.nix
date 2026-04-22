{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = [
      pkgs.unstable.claude-code
      pkgs.unstable.gemini-cli
    ];
  };
}
