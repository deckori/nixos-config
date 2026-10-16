{ self, ... }:
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

  flake.nixosModules.baikalSysMgr =
    { nixosModulesPath, ... }:
    {
      services.phpfpm.pools.baikal.settings = {
        "listen.owner" = "baikal";
        "listen.group" = "baikal";
        "listen.mode" = "0660";
      };

      systemd.services.nginx.serviceConfig.SupplementaryGroups = [ "baikal" ];

      imports = [

        (nixosModulesPath + "/services/web-apps/baikal.nix")
        (nixosModulesPath + "/services/web-servers/phpfpm/default.nix")
        self.nixosModules.baikal
      ];
    };
}
