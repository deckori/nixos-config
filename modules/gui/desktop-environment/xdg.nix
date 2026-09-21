{ ... }:

{
  flake.nixosModules.xdg =
    {
      pkgs,
      ...
    }:
    {
      xdg.portal = {
        xdgOpenUsePortal = true;
        config = {
          common = {
            default = [ "gtk" ];
            "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
          };
        };
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          xdg-desktop-portal-termfilechooser
        ];
      };
    };
}
