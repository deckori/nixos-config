{ ... }:

{
  flake.nixosModules.niri =
    {
      pkgs,
      lib,
      config,
      ...
    }:

    {
      environment.systemPackages = with pkgs; [
        xwayland-satellite # xwayland support
      ];

      programs.niri.package = pkgs.niri;

      # systemd.user.services.niri-flake-polkit.enable = false;

      # Polkit is now configured by noctalia-shell
      # security = {
      #   soteria.enable = true;
      #   polkit.enable = true;
      # };
    };

  flake.homeModules.niri =
    {
      lib,
      config,
      pkgs,
      ...
    }:

    {

      # home.packages = with pkgs; [ niri ];

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

    };
}
