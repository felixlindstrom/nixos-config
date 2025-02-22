{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us, se";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
    };
  };
}
