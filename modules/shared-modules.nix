{ inputs, ... }:
{
  flake.nixosModules.shared =
    { ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
        inputs.stylix.nixosModules.stylix
        inputs.nix-index-database.nixosModules.default
      ];

      nixpkgs.config.allowUnfree = true;
    };
}
