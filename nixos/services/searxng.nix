{ pkgs, ... }:
{
  services.searx = {
    enable = true;
    package = pkgs.stable.searxng;
    settings = {
      server.port = 8080;
      server.bind_address = "0.0.0.0";
      server.secret_key = "@SEARX_SECRET_KEY@";
    };
  };
}
