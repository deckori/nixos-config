{ inputs, ... }:

{
  flake.nixosModules.caddy =
    {
      pkgs,
      laptop,
      ...
    }:
    {
      services.caddy = {
        enable = true;

        virtualHosts."laptop".extraConfig = ''
          tls internal
          reverse_proxy ${laptop}
          respond "Hello. You're supposed to use the sub-domains."
        '';

      };
    };
}
