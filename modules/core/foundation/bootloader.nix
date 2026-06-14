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

    # increase the limits to avoid running out of inotify watches
    boot.kernel.sysctl = {
      "fs.inotify.max_user_watches" = 524288;
      "fs.inotify.max_user_instances" = 512;
    };

    boot.loader.efi = {
      canTouchEfiVariables = true;
    };

    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };
}
