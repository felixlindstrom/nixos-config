{ pkgs, ... }:
{
  home-manager.users.felix = { config, ... }: {
    programs.zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history = {
        append = true;
        expireDuplicatesFirst = true;
        extended = true;
        ignoreAllDups = true;
        ignoreSpace = false;
        path = "${config.xdg.dataHome}/.zsh_history";
        save = 100000;
        share = true;
      };

      historySubstringSearch = {
        enable = true;
        searchUpKey = [ "^N" ];
        searchDownKey = [ "^P" ];
      };

      shellAliases = {
        l = "ls -lFha";
        ldot = "ls -ld .*";
        lS = "ls -1FSsh";
        lsr = "ls -lARFh";
        grep = "grep --color";
        t = "tail -f";
        ff = "find . -type f -name";
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";
        d = "docker";
        dp = "docker ps";
        f = "fintech";
        k = "kubectl";
        kn = "kubectl -n";
        kni = "kubectl -n invoicing";
        knc = "kubectl -n contracts";
        knf = "kubectl -n fortnox";
        kcx = "kubectx";
        g = "git";
        gst = "git status";
        gl = "git pull";
        gc = "git commit -v";
        "gc!" = "git commit --amend";
        gcb = "git checkout -b";
        gcmsg = "git commit -m";
        gcm = "git checkout main";
        y = "yazi";
        vim = "nvim";
        nxm-switch = "sudo nixos-rebuild switch --flake ~/Projects/nixos-config#$(hostname)";
        nxm-update = "nix flake update --flake ~/Projects/nixos-config";
      };

      plugins = [
        {
          name = "zsh-vi-mode";
          src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
        }
        {
          name = "zsh-fzf-history-search";
          src = "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search";
        }
        {
          name = "zsh-forgit";
          src = pkgs.zsh-forgit;
          file = "share/zsh/zsh-forgit/forgit.plugin.zsh";
        }
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
          name = "zsh-nix-shell";
          src = pkgs.zsh-nix-shell;
          file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        }
        {
          name = "nix-zsh-completions";
          src = pkgs.nix-zsh-completions;
          file = "share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh";
        }
        {
          name = "zsh-you-should-use";
          src = pkgs.zsh-you-should-use;
          file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
        }
      ];

      initContent = "
        autoload -Uz edit-command-line
        zle -N edit-command-line
        zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
        zvm_after_init_commands+=(eval \"$(fzf --zsh)\")
        zvm_after_init_commands+=(\"bindkey '^v' edit-command-line\")
      ";
    };

    programs.yazi.enableZshIntegration = true;
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };

    programs.fzf = {
      enable = true;
      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [ "--preview 'eza --tree --level 5 {} | head -200'" ];
      defaultCommand = "fd --type f";
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--inline-info"
      ];
      colors = {
        "bg" = "#080808";
        "bg+" = "#262626";
        "border" = "#2e2e2e";
        "fg" = "#b2b2b2";
        "fg+" = "#e4e4e4";
        "gutter" = "#262626";
        "header" = "#80a0ff";
        "hl+" = "#f09479";
        "hl" = "#f09479";
        "info" = "#cfcfb0";
        "marker" = "#f09479";
        "pointer" = "#ff5189";
        "prompt" = "#80a0ff";
        "spinner" = "#36c692";
      };
    };
  };
}
