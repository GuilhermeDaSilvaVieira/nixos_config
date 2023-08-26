{ pkgs, ... }: {
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      rofi-wayland
      wlr-randr
      kanshi
      waybar
      mpvpaper
      swaybg
      imv
      mako
      grim
      slurp
      wl-clipboard
      wlsunset
    ];
  };
}
