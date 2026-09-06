{ ... }:
{
  flake.nixosModules.feishin =
    { pkgs, laptop, ... }:
    {
      services.feishin = {
        enable = true;
        domain = "localhost:9180, :9180";
        caddy.enable = true;
      };
    };
}
