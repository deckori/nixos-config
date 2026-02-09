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

  disko.devices.main.device = inputs.nixpkgs.lib.mkForce "/dev/disk/by-id/nvme-BIWIN_CE430T5D100-512G_2446143805918";
}
