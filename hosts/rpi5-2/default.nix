{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./common-user-config.nix
    ./hardware-configuration.nix
    ./network-config.nix
    ./random.nix
    ./users.nix
    ./disko.nix
  ];
}
