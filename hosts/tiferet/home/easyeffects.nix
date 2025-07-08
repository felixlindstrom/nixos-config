{ ... }:
let
  easyEffectsDir = ../assets/easyeffects;
in
{
  services.easyeffects = {
    enable = true;
    preset = "thinkpad";
  };

  home.file.".config/easyeffects/output/thinkpad.json" = {
    source = "${easyEffectsDir}/thinkpad.json";
  };
  home.file.".config/easyeffects/irs/impulse-dynamic.irs" = {
    source = "${easyEffectsDir}/impulse-dynamic.irs";
  };
  home.file.".config/easyeffects/irs/impulse-music.irs" = {
    source = "${easyEffectsDir}/impulse-music.irs";
  };
  home.file.".config/easyeffects/irs/impulse-voice.irs" = {
    source = "${easyEffectsDir}/impulse-voice.irs";
  };
}
