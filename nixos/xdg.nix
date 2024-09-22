{ ... }:
{
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
    icons.enable = true;
    mime = {
      enable = true;
      defaultApplications = {
        "text/*" = "Helix.desktop";
        "text/plain" = "Helix.desktop";
        "application/pdf" = "org.pwmt.zathura.desktop";
        "application/rdf+xml" = "org.pwmt.zathura.desktop";
        "application/rss+xml" = "org.pwmt.zathura.desktop";
        "application/xhtml+xml" = "org.pwmt.zathura.desktop";
        "application/xhtml_xml" = "org.pwmt.zathura.desktop";
        "application/xml" = "org.pwmt.zathura.desktop";
        "image/*" = "imv.desktop";
        "image/png" = "imv.desktop";
        "image/jpeg" = "imv.desktop";
        "image/gif" = "imv.desktop";
        "image/webp" = "imv.desktop";
        "video/*" = "mpv.desktop";
        "text/html" = "zen.desktop";
        "text/xml" = "zen.desktop";
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/about" = "zen.desktop";
        "x-scheme-handler/unknown" = "zen.desktop";
        "x-scheme-handler/mailto" = "zen.desktop";
        "x-scheme-handler/webcal" = "zen.desktop";
      };
    };
  };
}
