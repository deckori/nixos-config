{ ... }:

{
  imports = [
    ./bootloader.nix
    ./package-manager/default.laptop.nix
    ./gpu.nix
    ./lanzaboote.nix
    ./system.nix
  ];
}
