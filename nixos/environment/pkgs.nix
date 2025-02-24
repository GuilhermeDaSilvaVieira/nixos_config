{ inputs, pkgs, ... }:
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
      xdg-user-dirs
      openssl

      #### Browser
      inputs.zen-browser.packages."${system}".specific
      tor-browser
      tor

      #### Media
      ffmpeg
      ffmpegthumbnailer
      yazi
      mpv
      pavucontrol
      thunderbird
      yt-dlp
      zathura
      foliate
      shotcut

      # Editors
      helix
      renameutils

      transmission_4-gtk

      # Backup
      rsync

      appimage-run

      zoxide
      bat
      btop
      eza
      fd
      feh
      neofetch
      fzf
      stable.kitty
      redshift
      ripgrep
      stable.maim
      starship
    ];
  };
}
