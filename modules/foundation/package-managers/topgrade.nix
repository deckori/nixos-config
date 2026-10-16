{ ... }:

{
  flake.homeModules.topgrade =
    { ... }:
    {
      programs.topgrade = {
        enable = true;
        settings = {
          misc.disable = [ "nix" ];
        };
      };
    };
}
