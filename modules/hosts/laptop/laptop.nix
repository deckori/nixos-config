{
  inputs,
  self,
  ...
}:

{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
    ];
  };
}
