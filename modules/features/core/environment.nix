{ pkgs, ... }:
let
  variables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    NVM_DIR = "\${HOME}/.local/share/nvm";
    NPM_CONFIG_USERCONFIG = "\${HOME}/local/share/npm/config";
  };
in
{
  # System-level
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [ via bazecor brightnessctl ];
  services.udev.packages = with pkgs; [ via ];

  # Home-level
  home-manager.users.felix = {
    xdg.enable = true;
    home.sessionVariables = variables;
    systemd.user.sessionVariables = variables;
    home.sessionPath = [
      "\${HOME}/.local/share/npm/bin"
      "\${HOME}/bin"
      "\${HOME}/.cargo/bin"
    ];
  };
}
