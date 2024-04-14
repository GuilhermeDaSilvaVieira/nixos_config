{ pkgs, ... }: {
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      rofi-wayland
      wlr-randr
      kanshi
      eww
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
