{ pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]
  );
in
{
  home-manager.users.felix = {
    home.packages = [
      gdk
      pkgs.awscli2
      pkgs.devenv
      pkgs.terraform
      pkgs.kubectl
      pkgs.kubectx
      pkgs.kubernetes-helm
      pkgs.sops
      pkgs.age
    ];
  };
}
