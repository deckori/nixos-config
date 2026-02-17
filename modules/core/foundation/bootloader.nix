{ pkgs, lib, ... }:
{
  config = lib.mkIf (pkgs.stdenv.hostPlatform.system == "x86_64-linux") {
    boot.initrd.systemd.enable = true;
    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.supportedFilesystems = [ "ntfs" ];

    boot.loader.efi = {
      canTouchEfiVariables = true;
    };

    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };
}
