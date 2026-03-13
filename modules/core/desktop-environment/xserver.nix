{
  username,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.services.xserver.enable {
    services = {
      xserver = {
        xkb.layout = "us,ara";
      };
      displayManager = {
        enable = true;
        autoLogin = {
          enable = false;
          user = "${username}";
        };
      };
      libinput = {
        enable = true;
      };
    };
  };
}
