{
  pkgs,
  config,
  lib,
  ...
}:

let
  domain = "localhost";
in
{
  config = lib.mkIf config.services.odoo.enable {

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_18;
      ensureDatabases = [ "mydatabase" ];
      authentication = lib.mkOverride 10 ''
        # type  database  DBuser  auth-method
        local   all       all     trust
      '';
    };

    services.nginx = {
      enable = true;

      virtualHosts.${domain} = {
        listen = [
          {
            addr = "127.0.0.1";
            port = 80;
          }
        ];

        # local testing → no TLS
        enableACME = false;
        forceSSL = false;

        locations."/" = {
          proxyPass = "http://127.0.0.1:8070";
          proxyWebsockets = true;
        };
      };
    };

    services.odoo = {
      # domain = domain;
      autoInit = true;
      settings = {
        options = {
          xmlrpc_port = "8070";
        };
      };
    };
  };
}
