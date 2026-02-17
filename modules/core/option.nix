{
  lib,
  config,
  ...
}:

{
  options.consuetudo = {
    wm.enable = lib.mkEnableOption "Desktop environment packages";
    gui.enable = lib.mkEnableOption "GUI environment configs";
  };
}
