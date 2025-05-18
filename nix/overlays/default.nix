{ ...}:
{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev:
  {
    niri = prev.niri.overrideAttrs (oldAttrs: rec {
        pname = "niri";
        version = "25.05";
        src = prev.fetchFromGitHub {
          owner = "YaLTeR";
          repo = "niri";
          tag = "v25.05";
          hash = "sha256-ngQ+iTHmBJkEbsjYfCWTJdV8gHhOCTkV8K0at6Y+YHI=";
        };
        # cargoDeps = oldAttrs.cargoDeps.overrideAttrs (_: {
        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-tZp7AhhddEhKWzEUTgosxXMEzALbv6FxqnJEb9MBhzc=";
        };
    });
  };
}
