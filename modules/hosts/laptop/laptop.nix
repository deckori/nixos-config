{
  inputs,
  self,
  ...
}:

{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.laptopHardwareConfiguration
      self.nixosModules.bootLoader
    ];
  };
}
