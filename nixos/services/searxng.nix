{ ... }:
{
  services.searx = {
    enable = true;
    settings = {
      server.port = 8080;
      server.bind_address = "0.0.0.0";
      server.secret_key = "@SEARX_SECRET_KEY@";
    };
  };
}
