{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    #dotDir = "${config.home.homeDirectory}/.config/zsh";
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

    # completionInit = "recomp";

    shellAliases = {
      # ls, the common ones I use a lot shortened for rapid fire usage
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

      # Docker
      d = "docker";
      dp = "docker ps";

      # Instabee
      f = "fintech";

      # Kubernetes
      k = "kubectl";
      kn = "kubectl -n";
      kni = "kubectl -n invoicing";
      knc = "kubectl -n contracts";
      knf = "kubectl -n fortnox";
      kcx = "kubectx";

      # Git
      g = "git";
      gst = "git status";
      gl = "git pull";
      gc = "git commit -v";
      "gc!" = "git commit --amend";
      gcb = "git checkout -b";
      gcmsg = "git commit -m";
      gcm = "git checkout main";

      # Random
      y = "yazi";

      vim = "nvim";
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

      # Nix integration (essential for NixOS)
      {
        name = "zsh-nix-shell";
        src = pkgs.zsh-nix-shell;
        file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
      }

      # Nix completions
      {
        name = "nix-zsh-completions";
        src = pkgs.nix-zsh-completions;
        file = "share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh";
      }

      # Helpful suggestions (learn aliases)
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
  programs.direnv.enableZshIntegration = true;

  programs.fzf = {
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
    enable = true;
    # enableZshIntegration = true;
  };
}
