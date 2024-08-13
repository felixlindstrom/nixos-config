{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "gejiddohjgogedgjnonbofjigllpkmbf" # Chromium
    ];
  };
}
