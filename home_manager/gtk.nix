{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 48;
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic-bluish-accent";
    };
    iconTheme = {
      package = pkgs.zafiro-icons;
      name = "Zafiro-icons-Dark";
    };
  };

  home.pointerCursor = {
    x11.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 48;
    gtk.enable = true;
  };
}
