# Advanced: Use non-default kernel from kernel-firmware bundle
{
  config,
  pkgs,
  lib,
  ...
}:
let
  kernelBundle = pkgs.linuxAndFirmware.v6_6_31;
in
{
  boot.loader.raspberry-pi.firmwarePackage = kernelBundle.raspberrypifw;
  boot.loader.raspberry-pi.bootloader = "kernel";
  boot.kernelPackages = kernelBundle.linuxPackages_rpi5;

  boot.initrd.network.ssh = {
    enable = true;
    hostKeys = [
      "/etc/secrets/initrd/ssh_host_ed25519_key"
    ];
  };

  nixpkgs.overlays = lib.mkAfter [
    (self: super: {
      # This is used in (modulesPath + "/hardware/all-firmware.nix") when at least
      # enableRedistributableFirmware is enabled
      # I know no easier way to override this package
      inherit (kernelBundle) raspberrypiWirelessFirmware;
      # Some derivations want to use it as an input,
      # e.g. raspberrypi-dtbs, omxplayer, sd-image-* modules
      inherit (kernelBundle) raspberrypifw;
    })
  ];
}
