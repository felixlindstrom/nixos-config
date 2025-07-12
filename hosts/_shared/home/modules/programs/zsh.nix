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
      gcb = "git checkout -b";
      gcmsg = "git commit -m";

      # Random
      y = "yazi";

      # Editors
      n = "nvim .";

    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          sha256 = "1b4pksrc573aklk71dn2zikiymsvq19bgvamrdffpf7azpq6kxl2";
        };
      }
    ];

    initContent = "
      zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
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
    enable = true;
    enableZshIntegration = true;
  };
}
