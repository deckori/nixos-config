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
    libinput = {
      enable = true;
    };
  };
}
