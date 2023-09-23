{ pkgs, ... }: {
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      ristate
      kile-wl
      rofi-wayland
      wlr-randr
      kanshi
      eww-wayland
      mpvpaper
      swaybg
      imv
      mako
      grim
      slurp
      wl-clipboard
      wlsunset
      wf-recorder
    ];
  };
}
