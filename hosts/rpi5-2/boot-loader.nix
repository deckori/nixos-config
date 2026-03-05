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
  boot = {
    loader.raspberry-pi.firmwarePackage = kernelBundle.raspberrypifw;
    loader.raspberry-pi.bootloader = "kernel";
    kernelPackages = kernelBundle.linuxPackages_rpi5;
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
