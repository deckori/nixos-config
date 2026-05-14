{
  self,
  config,
  ...
}:

{
  flake.nixosModules.laptopHomeManager =
    { ... }:
    {
      home-manager = {
        users.${config.consuetudo.mainUsername} = {
          imports = [
            self.homeModules.btop
          ];
        };
      };
    };
}
