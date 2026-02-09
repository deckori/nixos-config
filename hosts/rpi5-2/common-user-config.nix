{ config, pkgs, ... }:
{
  imports = [
    ./network-config.nix
  ];

  time.timeZone = "UTC";
  networking.hostName = "rpi5-2";

  services.udev.extraRules = ''
    # Ignore partitions with "Required Partition" GPT partition attribute
    # On our RPis this is firmware (/boot/firmware) partition
    ENV{ID_PART_ENTRY_SCHEME}=="gpt", \
      ENV{ID_PART_ENTRY_FLAGS}=="0x1", \
      ENV{UDISKS_IGNORE}="1"
  '';

  environment.systemPackages = with pkgs; [
    tree
    htop
  ];

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  #        services = {
  #          xserver.enable = true;
  #          displayManager.sddm.enable = true;
  #          xserver.desktopManager.plasma5.enable = true;
  #        };

  boot.loader."raspberry-pi" = {
    enable = true;
    variant = "rpi5";
    kernelPackages = pkgs.linuxPackages_rpi5;
    bootloader = "kernel";
    firmware = {
      enable = true;
      device = "/dev/disk/by-id/nvme-BIWIN_CE430T5D100-512G_2446143805918-part1";
    };
  };

  system.nixos.tags =
    let
      cfg = config.boot.loader.raspberry-pi;
    in
    [
      "raspberry-pi-${cfg.variant}"
      cfg.bootloader
      config.boot.kernelPackages.kernel.version
    ];
}
