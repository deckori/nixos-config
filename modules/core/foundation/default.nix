{ ... }:

{
  imports = [
    ./package-manager
    ./bluetooth.nix
    ./hardware.nix
    ./misc.nix
    ./network.nix
    ./security.nix
    ./stylix
    ./user.nix
    ./passwords.nix
  ];
}
