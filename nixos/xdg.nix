{ inputs, outputs, ... }: {
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
    };
    icons.enable = true;
    mime.defaultApplications = {
      "text/plain" = "nvim.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
      "image/*" = "imv.desktop";
      "video/*" = "mpv.desktop";
    };
  };
}
