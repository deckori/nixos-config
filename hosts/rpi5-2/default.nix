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
    ../../modules/core/services
    # ../../modules/core/misc.nix
    # ../../modules/core/secrets
    # ../../modules/core/foundation
    ../../modules/core/foundation/package-manager/nix.nix
  ];
  # consuetudo = {
  #   # gpu.name = "hybrid-intel-nvidia";
  #   services.enable = true;
  # };

  virtualisation.libvirtd.enable = false;
  services.avahi.enable = true;
  services.odoo.enable = false;
  services.davfs2.enable = false;
  services.gotenberg.enable = false;
  services.suwayomi-server.enable = true;
  services.nextcloud.enable = false;
  services.taskchampion-sync-server.enable = true;

}
