{
  pkgs,
  config,
  lib,
  ...
}:

let
  domain = "something";
in
{
  config = lib.mkIf config.services.odoo.enable {
    services.postgresql = {
      enable = true;
      ensureDatabases = [ "mydatabase" ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
    services.nginx.virtualHosts.${domain} = {
      enableACME = true;
      forceSSL = true;
    };
    services.odoo = {
      domain = domain;
      autoInit = true;
    };
  };
}
