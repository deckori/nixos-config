{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.consuetudo.wm.enable {
    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
    ];
    security = {
      soteria.enable = true;
      polkit.enable = true;
    };
  };
}
