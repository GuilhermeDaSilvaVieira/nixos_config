{ pkgs, ... }: {
  environment = {
    defaultPackages =  [];
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

      libnotify
      exiftool

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
        ### Languages
          # Rust
          rustup

          # Dependencies
          llvmPackages_rocm.lldb
  
          # Nix
          nil
  
          # Markdown
          marksman
          slides
          graph-easy
          glow
  
          # Bash
          nodePackages_latest.bash-language-server 

      # Editors
      helix 

      # Tools
      lazygit
      tokei

      #### Proprietary
      (discord.override {
        withOpenASAR = true;
        # withVencord = true;
      })
      obsidian

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
      eza
      kitty
    ];
  };
}
