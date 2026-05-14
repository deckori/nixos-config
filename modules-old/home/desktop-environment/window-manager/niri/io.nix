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

    outputs = {

      "eDP-1" = {

        focus-at-startup = true;

        variable-refresh-rate = "on-demand";

        mode = {
          width = 1920;
          height = 1080;
          refresh = 144.001;
        };

        scale = 1;

        transform = {
          rotation = 0;
          # rotation = 90;
        };

        position = {
          x = 0;
          y = 0;
        };
      };

      "HDMI-A-5" = {

        mode = {
          width = 1920;
          height = 1080;
          refresh = 100.000;
        };

        scale = 0.9;

        transform = {
          rotation = 0;
          # rotation = 90;
        };

        position = {
          x = 0;
          y = -1200;
        };
      };
    };
  };
}
