{
  lib,
  ...
}:

{
  options.consuetudo.gui.enable = lib.mkEnableOption "GUI environment configs";

  options.consuetudo.programs.niri.enable = lib.mkEnableOption "Nixified config file for niri";

  options.consuetudo.colors = {
    rgb = lib.mkOption {
      type = lib.types.functionTo lib.types.str;
      description = "Returns comma separated rgb values for a color. To be used in css files:)";
    };
    rgba = lib.mkOption {
      type = lib.types.functionTo lib.types.str;
      description = "Returns comma separated rgba values for a color. To be used in css files:)";
    };
  };

}
