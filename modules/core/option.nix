{
  lib,
  ...
}:

{
  options = {
    consuetudo.wm.enable = lib.mkEnableOption "Desktop environment packages";
    consuetudo.gaming-config.enable = lib.mkEnableOption "Gaming Setup Configurations";

    consuetudo.gui.enable = lib.mkEnableOption "GUI environment configs";
    consuetudo.hyprlock.enable = lib.mkEnableOption "Hyprlock with PAM";
    consuetudo.nvidia-intel.enable = lib.mkEnableOption "Hybrid Nvidia and Intel GPU configuration";
    consuetudo.power.enable = lib.mkEnableOption "Power related configuration";
    consuetudo.btop-cuda.enable = lib.mkEnableOption "Install btop with cuda and a wrapper";

    consuetudo.programs.gitolite.enable = lib.mkEnableOption "Gitolite setup";
    consuetudo.programs.niri.enable = lib.mkEnableOption "Nixified config file for niri";

    consuetudo.colors = {
      rgb = lib.mkOption {
        type = lib.types.functionTo lib.types.str;
        description = "Returns comma separated rgb values for a color. To be used in css files:)";
      };
      rgba = lib.mkOption {
        type = lib.types.functionTo lib.types.str;
        description = "Returns comma separated rgba values for a color. To be used in css files:)";
      };
    };
  };
}
