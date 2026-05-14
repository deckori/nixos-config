{
  inputs,
  ...
}:

{
  # import home-manager to export
  # flake.homeConfigurations
  # and flake.homeModules
  # safely :D
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.nixosModules.homeManager =
    { ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
}
