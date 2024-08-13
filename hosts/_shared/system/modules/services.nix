{ config, pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us, se";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
