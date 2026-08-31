{ ... }:

{
  flake.nixosModules.feishin =
    { pkgs, ... }:
    {
      services.feishin.enable = true;
    };
}
