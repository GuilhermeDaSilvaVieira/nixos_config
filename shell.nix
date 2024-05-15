{ pkgs ? (import ./nixpkgs.nix) { } }: {
  default = pkgs.mkShell {
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git ];
  };
  wgpu = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      libxkbcommon
      libGL
      # WINIT_UNIX_BACKEND=wayland
      wayland
    ];
    shellHook = ''
      LD_LIBRARY_PATH="''${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}${
        with pkgs;
          lib.makeLibraryPath [
            vulkan-loader
            xorg.libX11
            xorg.libXcursor
            xorg.libXi
            xorg.libXrandr
          ]
      }"
      export LD_LIBRARY_PATH
    '';
    LD_LIBRARY_PATH = "${pkgs.libxkbcommon}/lib:${pkgs.libGL}/lib:${pkgs.wayland}/lib";
    RUST_BACKTRACE=1;
  };
}
