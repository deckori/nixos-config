{ inputs, self, ... }:

{
  flake.nixosConfigurations.hostname = inputs.nixpkgs.lib.nixosSystem {
    modules = [ ];
  };
}
