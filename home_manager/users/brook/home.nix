{
  outputs,
  config,
  pkgs,
  ...
}:
{
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
    username = "brook";
    homeDirectory = "/home/brook";
    packages = with pkgs; [
      cava
      spotify
    ];
    file = {
      "${config.home.homeDirectory}/.local/share/applications/spotify-adblock.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Spotify (adblock)
        GenericName=Music Player
        Icon=spotify-client
        TryExec=spotify
        Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
        Terminal=false
        MimeType=x-scheme-handler/spotify;
        Categories=Audio;Music;Player;AudioVideo;
        StartupWMClass=spotify      
      '';
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
