{
  pkgs ? (import ./nixpkgs.nix) { },
}:
{
  default = pkgs.mkShell {
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git
    ];
  };
  fastapi = pkgs.mkShell {
    packages = [
      pkgs.httpie
      (pkgs.python3.withPackages (
        python-pkgs: with python-pkgs; [
          fastapi
          uvicorn
          python-lsp-server
        ]
      ))
    ];
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
    RUST_BACKTRACE = 1;
  };
  matplotlib = pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (python-pkgs: [
        # select Python packages here
        python-pkgs.pandas
        python-pkgs.matplotlib
        python-pkgs.python-lsp-server
      ]))
    ];
  };
  smithay = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      pkg-config
      rustPlatform.bindgenHook
      autoPatchelfHook
      clang
    ];

    buildInputs = with pkgs; [
      wayland
      systemd # For libudev
      seatd # For libseat
      libxkbcommon
      libinput
      mesa # For libgbm
      fontconfig
      stdenv.cc.cc.lib
      pipewire
      pango
    ];

    runtimeDependencies = with pkgs; [
      wayland
      mesa
      libglvnd # For libEGL
    ];
    LD_LIBRARY_PATH = "${pkgs.libxkbcommon}/lib:${pkgs.libGL}/lib:${pkgs.wayland}/lib";
  };
}
