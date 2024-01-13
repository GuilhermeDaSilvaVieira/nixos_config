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

      exiftool
      libnotify

      #### Vulkan
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers

      #### Party tricks
      cmatrix
      cowsay
      figlet
      lolcat
      sl

      #### Browser
      librewolf-wayland
      (ungoogled-chromium.override {
        commandLineArgs = [
          "--force-device-scale-factor=1.0"
        ];
      })

      #### Media
      cava
      cinnamon.warpinator
      ffmpeg
      ffmpegthumbnailer
      lf
      mpv
      pavucontrol
      thunderbird
      virt-manager
      yt-dlp
      zathura

      #### Programming
        ### Languages
          # Bash
          nodePackages_latest.bash-language-server

          # Dependencies
          rocmPackages.llvm.lldb

          # Markdown
          glow
          graph-easy
          marksman
          slides

          # Nix
          nil

          # Rust
          rustup

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
      spotify
      tradingview

      bat
      btop
      eza
      fd
      feh
      freshfetch
      fzf
      kitty
      neofetch
      p7zip
      redshift
      ripgrep
      starship
      trash-cli
    ];
  };
}
