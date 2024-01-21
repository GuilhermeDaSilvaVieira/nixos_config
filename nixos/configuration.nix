# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ./users.nix
    ./networking.nix
    ./boot.nix
    ./services
    ./virtualisation.nix
    ./security.nix
    ./environment
    ./programs
    ./hardware
    ./i18n.nix
    ./xdg.nix
    ./fonts.nix
    ./console.nix
    ./time.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      (final: prev: { 
        awesome = inputs.nixpkgs-f2k.packages.${final.system}.awesome-luajit-git;
        # river = inputs.nixpkgs-f2k.packages.${final.system}.river-git;

        discord = prev.discord.overrideAttrs( _: {
          src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "0pml1x6pzmdp6h19257by1x5b25smi2y60l1z40mi58aimdp59ss";
          };
        });

        ristate = prev.ristate.overrideAttrs(oldAttrs: rec {
          version = "master";

          src = prev.fetchFromGitLab {
            owner = "snakedye";
            repo = "ristate";
            rev = "92e989f26cadac69af1208163733e73b4cf447da";
            hash = "sha256-6slH7R6kbSXQBd7q38oBEbngaCbFv0Tyq34VB1PAfhM";
          };

          cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
            inherit src;
            outputHash = "sha256-fOo9C0dNL9dYy5wXq/yEDqOV0OhOTEY42XK8ShpQh6k=";
          });
        });
      })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      permittedInsecurePackages = lib.optional (pkgs.obsidian.version == "1.5.3") "electron-25.9.0";
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  powerManagement.resumeCommands = ''
    kill wlsunset
    ${pkgs.wlsunset}/bin/wlsunset -t 3400 -T 3401
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
