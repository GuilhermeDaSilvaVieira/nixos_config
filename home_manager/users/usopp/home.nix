{ outputs, pkgs, ... }: {
  imports = [
    ../../gtk.nix
    ../../files.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "usopp";
    homeDirectory = "/home/usopp";
    packages = with pkgs; [
      # Anime
      ani-cli

      # Games
      mangohud
      (stable.retroarch.override {
        cores = with stable.libretro; [ 
          # Nintendo
          nestopia       # NES
          snes9x         # SNES
          dolphin        # Wii

          # Playstation
          beetle-psx-hw  # PS1
          pcsx2          # PS2
        ];
      }) 
      stable.yuzu-mainline
      stable.cemu
      steam

      (discord.override {
        withOpenASAR = true;
      })

      # Vulkan
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers

      # Party tricks
      cmatrix
      cowsay
      figlet
      lolcat
      sl
    ];
  };

  hardware.steam-hardware.enable = true;

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
