{ pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.claude-code
    pkgs-unstable.gemini-cli
  ];
}
