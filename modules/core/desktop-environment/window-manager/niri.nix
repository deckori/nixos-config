{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.programs.niri.enable {
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
}
