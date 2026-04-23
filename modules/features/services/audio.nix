{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # pactl client for volume control (wpctl from wireplumber is currently segfaulting)
  environment.systemPackages = [ pkgs.pulseaudio ];
}
