{ pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (with pkgs.google-cloud-sdk.components; [
    gke-gcloud-auth-plugin
  ]);
in
{
  home.packages = [
    gdk
    pkgs.jetbrains.datagrip
    pkgs.fira-code-nerdfont
    pkgs.kubectl
    pkgs.kubectx
    pkgs.terraform
    pkgs.sops
    pkgs.awscli2
    pkgs.nixpkgs-fmt
    pkgs.nil
    pkgs.gnumake
  ];
}
