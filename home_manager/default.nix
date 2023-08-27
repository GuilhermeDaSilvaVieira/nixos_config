{ inputs, outputs, ... }: {
  imports = [
    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      enma = import ./users/enma/home.nix;
      wado_ichimonji = import ./users/wado_ichimonji/home.nix;
      sandai_kitetsu = import ./users/sandai_kitetsu/home.nix;
    };
  };
}
