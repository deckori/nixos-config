{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.home-manager.nixosModules.home-manager
    inputs.xremap-flake.nixosModules.default
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.stylix.nixosModules.stylix
    inputs.nix-index-database.nixosModules.default
    inputs.noctalia.nixosModules.default
    inputs.aagl.nixosModules.default # For hsr
    # inputs.niri-flake.nixosModules.niri
    inputs.nix-minecraft.nixosModules.minecraft-servers # For minecraft
  ];

  nixpkgs.config.allowUnfree = true;
}
