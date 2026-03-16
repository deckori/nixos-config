{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.niri = {
    # package = pkgs.niri;
    config = ''
      screenshot-path null
    '';
  };
  programs.niri.settings = {

    spawn-at-startup = [
      {
        command = [
          "noctalia-shell"
          "kitty"
          "firefox"
          "thunderbird"
          "beeper"
          "/run/current-system/sw/bin/soteria"
          "copyq"
          "ashell"
          "swayosd-server"
        ];
      }
      { sh = "steam -silent -console"; }
      {
        argv = [
          "waypaper"
          "--restore"
        ];
      }
      {
        argv = [
          "gobatmon"
          "-normal-warning-threshold"
          "40"
        ];
      }
    ];

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
  # xdg.configFile."niri/design/colors.kdl" = {
  #   text = with config.lib.stylix.colors.withHashtag; ''
  #     overview {
  #       backdrop-color "${base00}"
  #     }
  #     layout {
  #       focus-ring {
  #         // Color of the ring on the active monitor.
  #         active-color "${base0D}"
  #
  #         // Color of the ring on inactive monitors.
  #         inactive-color "${base03}"
  #       }
  #       border {
  #         active-color "${base0D}"
  #         inactive-color "${base03}"
  #       }
  #       shadow {
  #         color "${base01}"
  #       }
  #     }
  #   '';
  # };
}
