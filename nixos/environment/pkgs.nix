{ pkgs, ... }: {
  environment = {
    defaultPackages =  [];
    systemPackages = with pkgs; [
      # TODO: Rewrite groups of packages like 'Core'
      #### Core
      clang
      exfat
      gcc
      git
      glibc
      killall
      lld
      llvmPackages.bintools
      lm_sensors
      unzip
      wget
      zip
      tree
      exiftool
      libnotify

      #### Browser
      librewolf-wayland
      tor-browser
      tor

      #### Media
      cinnamon.warpinator
      ffmpeg
      ffmpegthumbnailer
      yazi
      mpv
      pavucontrol
      thunderbird
      yt-dlp
      zathura

      # Editors
      helix

      zoxide
      bat
      btop
      eza
      fd
      feh
      freshfetch
      neofetch
      fzf
      stable.kitty
      redshift
      ripgrep
      maim
      starship
    ];
  };
}
