{ ... }:

{
  flake.nixosModules.radicale =
    { pkgs, ... }:
    {
      services.radicale = {
        enable = true;
        settings.server.hosts = [ "0.0.0.0:5232" ];
      };
    };
}
