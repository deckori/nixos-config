{
  lib,
  ...
}:

{
  options.consuetudo.wm.enable = lib.mkEnableOption "Desktop environment packages";
  options.consuetudo.gaming-config.enable = lib.mkEnableOption "Gaming Setup Configurations";

  options.consuetudo.gui.enable = lib.mkEnableOption "GUI environment configs";
  options.consuetudo.hyprlock.enable = lib.mkEnableOption "Hyprlock with PAM";
  options.consuetudo.nvidia-intel.enable = lib.mkEnableOption "Hybrid Nvidia and Intel GPU configuration";

  options.consuetudo.programs.gitolite.enable = lib.mkEnableOption "Gitolite setup";
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
