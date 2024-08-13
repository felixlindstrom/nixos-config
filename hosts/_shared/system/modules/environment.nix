{ ... }:
{
  environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          chromium
        '';
        mode = "0755";
      };
    };
}