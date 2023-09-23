{ pkgs, ... }: {
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      ristate
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
