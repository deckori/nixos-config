{
  inputs,
  ...
}:

{
  # `inputs.home-manager.flakeModules.home-manager` enables flake-parts options such as flake.homeModules and homeConfigurations
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.nixosModules.homeManager =
    { ... }:
    {
      # `inputs.home-manager.nixosModules.home-manager` wires home-manager into NixOS so that home.* options are evaluated as part of the system build
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = ".backup";
      };
    };
}
