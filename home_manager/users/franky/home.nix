{ outputs, pkgs, ... }:
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
    username = "franky";
    homeDirectory = "/home/franky";
    packages = with pkgs; [
      # Dependencies
      rocmPackages.llvm.lldb

      # Tools
      lazygit
      tokei
      devbox

      # Bash
      nodePackages_latest.bash-language-server

      # Markdown
      marksman

      # Nix
      nil
      nixfmt-rfc-style

      # Rust
      rustup

      # Virtualization
      virt-manager
    ];
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
