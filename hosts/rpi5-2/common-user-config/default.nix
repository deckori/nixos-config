# Further user configuration
{ ... }:

{
  imports = [
    ./common-user-config.nix
    ./network-config.nix
    ./users-config-stub.nix
  ];
}
