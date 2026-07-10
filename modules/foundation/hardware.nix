{ ... }:

{
  flake.nixosModules.hardware =
    { config, pkgs, ... }:
    {
      time.timeZone = "Asia/Qatar";
      environment.sessionVariables.TZ = config.time.timeZone;
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

      # Language settings
      i18n.defaultLocale = "en_US.UTF-8";

      # OpenGL
      hardware.graphics = {
        enable = true;
      };

      hardware.enableRedistributableFirmware = true;

      zramSwap.enable = true;
    };
}
