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
    ./cachix.nix
    # ../../modules/core/cli
    # ../../modules/core/services
    # ../../modules/core/option.nix
    # ../../modules/core/misc.nix
    ../../modules/core/secrets
    # ../../modules/core/foundation
    ../../modules/core/foundation/user.nix
    ../../modules/core/foundation/stylix
    ../../modules/core/foundation/package-manager
  ];
  # consuetudo = {
  #   # gpu.name = "hybrid-intel-nvidia";
  #   services.enable = true;
  # };

}
