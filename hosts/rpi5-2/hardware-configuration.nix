{
  config,
  pkgs,
  lib,
  nixos-raspberrypi,
  ...
}:
{
  imports = with nixos-raspberrypi.nixosModules; [
    # Hardware configuration
    nixos-raspberrypi.lib.inject-overlays-global
    raspberry-pi-5.base
    raspberry-pi-5.page-size-16k
    # raspberry-pi-5.display-vc4
    # raspberry-pi-5.display-rp1
    raspberry-pi-5.bluetooth
  ];

  # fileSystems = {
  #   "/boot/firmware" = {
  #     device = "/dev/disk/by-label/FIRMWARE";
  #     fsType = "vfat";
  #     options = [
  #       "noatime"
  #       "noauto"
  #       "x-systemd.automount"
  #       "x-systemd.idle-timeout=1min"
  #     ];
  #   };
  #   "/" = {
  #     device = "/dev/disk/by-label/NIXOS_SD";
  #     fsType = "ext4";
  #     options = [ "noatime" ];
  #   };
  # };
}
