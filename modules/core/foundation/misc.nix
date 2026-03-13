{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  services.gvfs.enable = true;
  services.fwupd.enable = true;

  services.gnome = {
    tinysparql.enable = true;
    gnome-keyring.enable = true;
  };

  services.dbus = {
    enable = true;
    # needed for GNOME services outside of GNOME Desktop
    packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];
  };
  services.fstrim.enable = true;

}
