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

  system.nixos.tags =
    let
      cfg = config.boot.loader.raspberryPi;
    in
    [
      "raspberry-pi-${cfg.variant}"
      cfg.bootloader
      config.boot.kernelPackages.kernel.version
    ];
}
