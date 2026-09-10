{ ... }:
{
  flake.nixosModules.baikal =
    { pkgs, ... }:
    {
      services.baikal = {
        enable = true;
        virtualHost = "baikal"; # nginx vhost name — matches nginx.virtualHosts.baikal below
      };

      services.nginx = {
        enable = true;
        virtualHosts.baikal = {
          listen = [
            {
              addr = "localhost";
              port = 8120;
            }
          ];
          extraConfig = ''
            absolute_redirect off;
          '';
        };
      };
    };
}
