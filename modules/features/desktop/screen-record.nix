{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = with pkgs; [
      obs-studio
      wf-recorder
      slurp
    ];
  };
}
