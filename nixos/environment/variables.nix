{ ... }:
{
  environment.variables = {
    FZF_DEFAULT_COMMAND = "fd -H";

    LIBSEAT_BACKEND = "logind";

    WLR_NO_HARDWARE_CURSORS = "1";
    # WLR_RENDERER = "vulkan";

    NIXOS_OZONE_WL = "1";

    QT_QPA_PLATFORM = "wayland;xcb";

    KITTY_ENABLE_WAYLAND = "1";

    # LIBVA_DRIVER_NAME = "nvidia";
    # XDG_SESSION_TYPE = "wayland";
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    EDITOR = "hx";
    VISUAL = "hx";
  };
}
