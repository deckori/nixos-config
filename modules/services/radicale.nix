{ inputs, ... }:

{
  flake.nixosModules.radicale =
    { pkgs, ... }:
    {
      services.radicale = {
        enable = true;
        settings = {
          server.hosts = [ "0.0.0.0:5232" ];
          auth = {
            type = "htpasswd";
            htpasswd_filename = "${inputs.secrets}/services/radicale/radicale_users";
            htpasswd_encryption = "autodetect";
          };
        };
      };
    };
}
