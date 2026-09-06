{ ... }:

{
  flake.nixosModules.baikal =
    { pkgs, ... }:
    {
      services.baikal.enable = true;
    };
}
