{ outputs, config, pkgs, ... }: {
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
    username = "robin";
    homeDirectory = "/home/robin";
    packages = with pkgs; [
      stable.obsidian
    ];
    files = {
    "${config.home.homeDirectory}/.local/share/applications/obsidian-wayland.desktop".text = '' 
        [Desktop Entry]
        Categories=Office
        Comment=Knowledge base
        Exec=env XDG_SESSION_TYPE="" QT_QPA_PLATFORM="" WAYLAND_DISPLAY="" KITTY_ENABLE_WAYLAND="" obsidian %u
        Icon=obsidian
        MimeType=x-scheme-handler/obsidian
        Name=Obsidian (Wayland)
        Type=Application
        Version=1.4
      '';
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
