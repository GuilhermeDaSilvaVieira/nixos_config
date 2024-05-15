{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      enma = import ./users/enma/home.nix;
      wado_ichimonji = import ./users/wado_ichimonji/home.nix;

      luffy = import ./users/luffy/home.nix;
      zoro = import ./users/zoro/home.nix;
      nami = import ./users/nami/home.nix;
      usopp = import ./users/usopp/home.nix;
      sanji = import ./users/sanji/home.nix;
      chopper = import ./users/chopper/home.nix;
      robin = import ./users/robin/home.nix;
      franky = import ./users/franky/home.nix;
      brook = import ./users/brook/home.nix;
      jinbe = import ./users/jinbe/home.nix;
    };
  };
}
