# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    discord = prev.discord.overrideAttrs( _: {
      src = builtins.fetchTarball {
      url = "https://discord.com/api/download?platform=linux&format=tar.gz";
      sha256 = "0pml1x6pzmdp6h19257by1x5b25smi2y60l1z40mi58aimdp59ss";
      };
    });
    awesome = inputs.nixpkgs-f2k.packages.${final.system}.awesome-luajit-git;
    river = inputs.nixpkgs-f2k.packages.${final.system}.river-git;
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
