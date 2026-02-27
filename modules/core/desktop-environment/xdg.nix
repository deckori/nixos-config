{
  pkgs,
  ...
}:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
      xdg-desktop-portal-termfilechooser
    ];
  };
}
