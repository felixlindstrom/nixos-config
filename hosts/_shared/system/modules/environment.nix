{ pkgs, ... }:
{
  environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          chromium
        '';
        mode = "0755";
      };
    };
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [
    via
  ];
  services.udev.packages = with pkgs; [
    via
  ];
}
