{ pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
    ]
  );
in
{
  home.packages = [
    gdk
    pkgs.awscli2
    pkgs.devenv
    pkgs.gnumake
    pkgs.jetbrains.datagrip
    pkgs.pgcli
    pkgs.kubectl
    pkgs.kubectx
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.sops
    pkgs.terraform
    pkgs.kubernetes-helm
    pkgs.gh
    pkgs.gcc
  ];
}
