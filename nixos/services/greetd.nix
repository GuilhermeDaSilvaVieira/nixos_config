{ pkgs, ... }:
{
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu -t -c river";
      };
    };
  };
}
