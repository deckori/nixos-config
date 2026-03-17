{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.stylix.nixosModules.stylix
    inputs.nix-index-database.nixosModules.default
    # inputs.niri-flake.nixosModules.niri
  ];

  nixpkgs.config.allowUnfree = true;
}
