{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    config = ''
      include "./config-extra.kdl"
    '';
    settings = {
      spawn-at-startup = [
        {
          command = [
            "noctalia-shell"
          ];
        }
      ];
    };
  };

  xdg.configFile."niri/design/colors.kdl" = {
    text = with config.lib.stylix.colors.withHashtag; ''
      overview {
        backdrop-color "${base00}"
      }
      layout {
        focus-ring {
          // Color of the ring on the active monitor.
          active-color "${base0D}"

          // Color of the ring on inactive monitors.
          inactive-color "${base03}"
        }
        border {
          active-color "${base0D}"
          inactive-color "${base03}"
        }
        shadow {
          color "${base01}"
        }
      }
    '';
  };
}
