{ config, ... }: {
  home.file = {
    # Shortcuts 
    "${config.home.homeDirectory}/media".source = config.lib.file.mkOutOfStoreSymlink "/run/media/${config.home.username}";

    # Dotfiles
    "${config.xdg.configHome}/awesome".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/awesome";
    "${config.xdg.configHome}/btop".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/btop";
    "${config.xdg.configHome}/cava".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/cava";
    "${config.xdg.configHome}/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/fish";
    "${config.xdg.configHome}/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/kitty";
    "${config.xdg.configHome}/lf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/lf";
    "${config.xdg.configHome}/mpv".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/mpv";
    "${config.xdg.configHome}/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/nvim";
    "${config.xdg.configHome}/picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/picom";
    "${config.xdg.configHome}/zathura".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/zathura";
    "${config.xdg.configHome}/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/starship/starship.toml";
    "${config.xdg.configHome}/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/waybar";
    "${config.xdg.configHome}/helix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/helix";
    "${config.xdg.configHome}/river".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/river";
    "${config.xdg.configHome}/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/rofi";
    "${config.xdg.configHome}/eww".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/eww";
    "${config.xdg.configHome}/yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/.dotfiles/yazi";

    # Xorg
    "${config.home.homeDirectory}/.xinitrc".text = ''
        #!/bin/sh
        
        userresources=$HOME/.Xresources
        usermodmap=$HOME/.Xmodmap
        sysresources=/etc/X11/xinit/.Xresources
        sysmodmap=/etc/X11/xinit/.Xmodmap
        
        # merge in defaults and keymaps
        if [ -f $sysresources ]; then
          xrdb -merge $sysresources
        fi
        
        if [ -f $sysmodmap ]; then
            xmodmap $sysmodmap
        fi
        
        if [ -f "$userresources" ]; then
          xrdb -merge "$userresources"
        fi
        
        if [ -f "$usermodmap" ]; then
            xmodmap "$usermodmap"
        fi
        
        # start some nice programs
        
        if [ -d /etc/X11/xinit/xinitrc.d ] ; then
         for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
          [ -x "$f" ] && . "$f"
         done
         unset f
        fi
        
        exec awesome
      '';

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
}
