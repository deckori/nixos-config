{
  lib,
  config,
  username,
  ...
}:

{
  options.consuetudo.hyprlock.enable = lib.mkEnableOption "Hyprlock with PAM";

  config = lib.mkIf config.consuetudo.hyprlock.enable {
    security.pam.services.hyprlock = { };
  };
}
