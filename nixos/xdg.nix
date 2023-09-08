{ ... }: {
xdg = {
  portal = {
    enable = true;
    wlr.enable = true;
  };
  icons.enable = true;
  mime = {
    enable = true;
    defaultApplications = {
      # "text/plain" = "nvim.desktop";
      "text/*" = "Helix.desktop";
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
  };
}
