{ pkgs, ... }:
{
  environment = {
    defaultPackages = [ ];
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
      mullvad-browser
      tor-browser
      tor

      #### Media
      warpinator
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

      renameutils

      transmission_4-gtk

      # Backup
      rsync

      zoxide
      bat
      btop
      eza
      fd
      feh
      neofetch
      fzf
      kitty
      redshift
      ripgrep
      maim
      starship
    ];
  };
}
