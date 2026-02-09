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
    ../../modules/core
  ];
  consuetudo = {
    # gpu.name = "hybrid-intel-nvidia";
    services.enable = true;
  };

}
