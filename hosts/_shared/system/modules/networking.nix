{ config, pkgs, ... }:
{
    networking.networkmanager.enable = true;

    services.tailscale = {
        enable = true;
        extraUpFlags = [
            "--operator=felix"
            "--accept-routes=true" # Not sure this works as intended. Had to do it manually.
        ];
    };
}