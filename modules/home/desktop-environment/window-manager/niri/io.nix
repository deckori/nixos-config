{ ... }:

{
  programs.niri.settings = {
    cursor = {
      hide-when-typing = true;
      hide-after-inactive-ms = 1000;
    };

    input = {
      keyboard.numlock = true;
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
    };

    outputs."eDP-1" = {

      mode = "1920x1080@144.001";
      # mode = "1920x1080@60.001";

      scale = 1;

      transform = "normal";
      # transform = "90";

      position = {
        x = 0;
        y = 0;
      };
    };

    outputs."HDMI-A-5" = {

      mode = "1920x1080@100";

      scale = 0.9;

      transform = "normal";
      # transform = "90";

      position = {
        x = 0;
        y = -1200;
      };
    };
  };
}
