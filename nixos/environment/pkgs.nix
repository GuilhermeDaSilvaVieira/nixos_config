{ inputs, outputs, pkgs, ... }: {
  environment = {
    defaultPackages = with pkgs; [];
    systemPackages = with pkgs; [
# TODO: Rewrite groups of packages like 'Core'
      #### Core
      lld
      gcc
      glibc
      clang
      llvmPackages.bintools
      wget
      killall
      zip
      unzip
      exfat
      lm_sensors
      git

      #### Vulkan
      vulkan-tools
      vulkan-validation-layers
      vulkan-loader

      #### Party tricks
      cmatrix
      cowsay
      sl
      lolcat
      figlet

      #### Browser
      librewolf-wayland
      ungoogled-chromium

      #### Media
      yt-dlp
      cava
      pavucontrol
      zathura
      lf
      ffmpeg
      ffmpegthumbnailer
      mpv
      thunderbird
      cinnamon.warpinator
      virt-manager

      #### Programming
      lazygit
      tokei

      #### Proprietary
      discord

      starship      
      redshift
      feh
      bat
      p7zip
      freshfetch
      neofetch
      trash-cli
      fzf
      fd
      ripgrep
      btop
      exa
      kitty
    ];
  };
}
