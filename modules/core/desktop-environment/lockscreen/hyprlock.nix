{
  lib,
  config,
  username,
  ...
}:

{
  config = lib.mkIf config.consuetudo.hyprlock.enable {
    security.pam.services.hyprlock = { };
  };
}
