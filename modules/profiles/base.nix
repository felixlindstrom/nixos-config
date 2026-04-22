{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ../overlays.nix

    # Core
    ../features/core/boot.nix
    ../features/core/networking.nix
    ../features/core/nix-settings.nix
    ../features/core/users.nix
    ../features/core/i18n.nix
    ../features/core/environment.nix

    # Desktop
    ../features/desktop/niri.nix
    ../features/desktop/greeter.nix
    ../features/desktop/dotfiles.nix
    ../features/desktop/notifications.nix
    ../features/desktop/fuzzel.nix
    ../features/desktop/clipboard.nix
    ../features/desktop/quickshell.nix
    ../features/desktop/screen-record.nix

    # Shell
    ../features/shell/zsh.nix
    ../features/shell/starship.nix

    # Security
    ../features/security/sops.nix
    ../features/security/keyring.nix
    ../features/security/onepassword.nix
    ../features/security/ssh.nix
    ../features/security/gpg.nix

    # Dev
    ../features/dev/git.nix
    ../features/dev/docker.nix
    ../features/dev/node.nix
    ../features/dev/go.nix
    ../features/dev/java.nix
    ../features/dev/rust.nix
    ../features/dev/databases.nix
    ../features/dev/cloud.nix
    ../features/dev/ai.nix
    ../features/dev/npm.nix

    # Hardware
    ../features/hardware/gpu.nix
    ../features/hardware/bluetooth.nix
    ../features/hardware/battery.nix

    # IDEs
    ../features/ides/neovim.nix
    ../features/ides/zed.nix
    ../features/ides/idea.nix
    ../features/ides/datagrip.nix

    # Programs
    ../features/programs/browser.nix
    ../features/programs/terminal.nix
    ../features/programs/media.nix
    ../features/programs/office.nix
    ../features/programs/chat.nix
    ../features/programs/fonts.nix
    ../features/programs/file-manager.nix
    ../features/programs/essentials.nix
    ../features/programs/cursor.nix

    # Services
    ../features/services/audio.nix
    ../features/services/printing.nix

    # Work
    # ../features/work/sentinelone.nix
    ../features/work/tools.nix
    ../features/work/ergo.nix
  ];

  # Home-manager integration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.felix = {
      home = {
        username = "felix";
        homeDirectory = "/home/felix";
        stateVersion = "25.11";
      };
      programs.home-manager.enable = true;
      systemd.user.startServices = "sd-switch";
    };
  };
}
