{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.boot.lanzaboote.enable {
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
