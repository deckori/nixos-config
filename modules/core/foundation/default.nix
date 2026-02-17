{ ... }:

{
  imports = [
    ./bootloader.nix
    ./lanzaboote.nix
    ./package-manager
    ./power.nix
    ./gpu.nix
    ./language.nix
    ./clock.nix
    ./bluetooth.nix
    ./package-manager
    ./hardware.nix
    ./misc.nix
    ./network.nix
    ./security.nix
    ./stylix
    ./passwords.nix
  ];
}
