{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.consuetudo.wm.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [
          "gtk"
        ];
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal
        xdg-desktop-portal-gnome
        xdg-desktop-portal-wlr
        xdg-desktop-portal-termfilechooser
      ];
    };
  };
}
