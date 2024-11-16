{
  inputs,
  outputs,
  lib,
  config,
  ...
}:
{
  imports = [
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
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      (final: prev: {
        awesome = inputs.nixpkgs-f2k.packages.${final.system}.awesome-luajit-git;
        # river = inputs.nixpkgs-f2k.packages.${final.system}.river-git;
      })
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-substituters = [
        "https://cache.nixos.org/"
      ];
      auto-optimise-store = true;
      # substituters = [ "https://cosmic.cachix.org/" ];
      # trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
      max-jobs = 6;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    # size in bytes 128MB
    extraOptions = ''
      download-buffer-size = 134217728
    '';
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
