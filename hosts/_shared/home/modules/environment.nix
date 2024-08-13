{ ... }:
let
  variables = {
    BROWSER = "chromium";
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    #XDG_CACHE_HOME = "\${HOME}/.cache";
    #XDG_CONFIG_HOME = "\${HOME}/.config";
    #XDG_BIN_HOME = "\${HOME}/.local/bin";
    #XDG_DATA_HOME = "\${HOME}/.local/share";

    NVM_DIR="\${HOME}/.local/share/nvm";
    NPM_CONFIG_USERCONFIG="\${HOME}/local/share/npm/config";
    #SSH_AUTH_SOCK="~/.1password/agent.sock";
  };
in
{
  xdg.enable = true;
  home.sessionVariables = variables;
  systemd.user.sessionVariables = variables;
}
