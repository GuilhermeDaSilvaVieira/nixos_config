{ ... }: {
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
    icons.enable = true;
    mime.defaultApplications = {
      # "text/plain" = "nvim.desktop";
      "text/plain" = "Helix.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
      "image/*" = "imv.desktop";
      "video/*" = "mpv.desktop";
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
