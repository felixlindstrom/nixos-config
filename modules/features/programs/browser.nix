{ pkgs, ... }:
let
  lock-false = { Value = false; Status = "locked"; };
  lock-true = { Value = true; Status = "locked"; };
  lock-zero = { Value = 0; Status = "locked"; };
in
{
  home-manager.users.felix = {
    programs.firefox = {
      enable = true;
      languagePacks = [ "en-US" "sv-SE" ];

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "always";
        SearchBar = "unified";

        ExtensionSettings = {
          "*".installation_mode = "blocked";
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
            installation_mode = "force_installed";
          };
          "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4438510/refined_github-25.2.17.xpi";
            installation_mode = "force_installed";
          };
          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          "foxytab@eros.man" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4066782/foxytab-2.31.xpi";
            installation_mode = "force_installed";
          };
        };

        Preferences = {
          "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;
          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
          "browser.tabs.inTitlebar" = lock-zero;
          "media.ffmpeg.vaapi.enabled" = lock-true;
          "media.hardware-video-decoding.enabled" = lock-true;
          "media.hardware-video-decoding.force-enabled" = lock-true;
          "media.ffmpeg.vaapi-drm-display.enabled" = lock-true;
          "media.webrtc.hw.h264.enabled" = lock-true;
          "media.getusermedia.noise_suppression" = lock-false;
          "media.getusermedia.aec_enabled" = lock-false;
          "gfx.webrender.all" = lock-true;
        };
      };
    };

    xdg.mimeApps.defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/mailto" = "firefox.desktop";
      "x-scheme-handler/webcal" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
