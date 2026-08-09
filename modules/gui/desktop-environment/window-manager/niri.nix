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

    };
}
