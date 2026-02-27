{
  username,
  ...
}:
{
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
    # To prevent getting stuck at shutdown
    systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
    libinput = {
      enable = true;
    };
  };
}
