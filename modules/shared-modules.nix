{ inputs, ... }:

{
  # import home-manager to export
  # flake.homeConfigurations
  # and flake.homeModules
  # safely :D
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
}
