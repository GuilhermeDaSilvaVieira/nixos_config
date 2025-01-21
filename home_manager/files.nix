{ config, ... }:
{
  home.file = {
    # Shortcuts
    "${config.home.homeDirectory}/media".source =
      config.lib.file.mkOutOfStoreSymlink "/run/media/${config.home.username}";

    # Dotfiles
    "${config.xdg.configHome}/awesome".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/awesome";
    "${config.xdg.configHome}/btop".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/btop";
    "${config.xdg.configHome}/fish".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/fish";
    "${config.xdg.configHome}/kitty".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/kitty";
    "${config.xdg.configHome}/lf".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/lf";
    "${config.xdg.configHome}/mpv".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/mpv";
    "${config.xdg.configHome}/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
    "${config.xdg.configHome}/picom".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/picom";
    "${config.xdg.configHome}/zathura".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zathura";
    "${config.xdg.configHome}/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/starship/starship.toml";
    "${config.xdg.configHome}/waybar".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/waybar";
    "${config.xdg.configHome}/helix".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/helix";
    "${config.xdg.configHome}/river".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/river";
    "${config.xdg.configHome}/rofi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/rofi";
    "${config.xdg.configHome}/eww".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/eww";
    "${config.xdg.configHome}/yazi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/yazi";
    "${config.xdg.configHome}/niri".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/niri";

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
  };
}
