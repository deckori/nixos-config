{ ... }:

{
  imports = [
    ./boot-loader.nix
    ./hardware-configuration.nix
    ./pi5-configtxt.nix

    # WARNING: formatting disk with disko is DESTRUCTIVE, check if
    # `disko.devices.disk.nvme0.device` is set correctly!
    # ./disko-usb-btrfs.nix
    ./disko.nix
  ];
}
