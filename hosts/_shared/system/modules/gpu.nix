{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    # VA-API drivers for hardware video decode (reduces CPU during video calls)
    extraPackages = with pkgs; [
      intel-media-driver # iHD — Intel Gen9+ (Broadwell/Skylake and newer)
    ];
  };
}
