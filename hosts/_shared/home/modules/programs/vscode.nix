{ pkgs, inputs, unstable, ... }:
{
  programs.vscode = {
    package = unstable.vscode;
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-marketplace; [
      bbenoist.nix
      adpyke.vscode-sql-formatter
      bibhasdn.unique-lines
      buster.ndjson-colorizer
      dbaeumer.vscode-eslint
      eamodio.gitlens
      editorconfig.editorconfig
      fabiospampinato.vscode-diff
      ftonato.password-generator
      github.copilot
      github.copilot-chat
      hashicorp.terraform
      jebbs.plantuml
      jonathanlewis.vs-code-gen-mongo-id
      marcoq.vscode-typescript-to-json-schema
      maximus136.change-string-case
      mechatroner.rainbow-csv
      ms-python.debugpy
      ms-python.python
      ms-python.vscode-pylance
      ms-vscode.makefile-tools
      netcorext.uuid-generator
      redhat.vscode-xml
      redhat.vscode-yaml
      signageos.signageos-vscode-sops
      supperchong.pretty-json
      visualstudioexptteam.vscodeintellicode
      vscodevim.vim
      wmaurer.change-case
      yinfei.luahelper
      zengxingxin.sort-js-object-keys
      esbenp.prettier-vscode
      jnoortheen.nix-ide
      redhat.java
      vscjava.vscode-java-pack
    ];
  };
}
