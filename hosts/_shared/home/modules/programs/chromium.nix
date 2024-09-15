{ pkgs, ... }: {
  programs.firefox.enable = true;
  programs.chromium = {
    enable = true;
    extensions = [
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "gejiddohjgogedgjnonbofjigllpkmbf" # Chromium
      "hlepfoohegkhhmjieoechaddaejaokhf" # Github Refined
    ];
  };
}
