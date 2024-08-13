{ ... }:
{
  programs.npm = {
    enable = true;
    npmrc = ''
      prefix = ''${HOME}/.local/share/npm
    '';
  };
}