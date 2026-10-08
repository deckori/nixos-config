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

      home.packages = with pkgs; [ niri ];
    };

  flake.nixosModules.niriSysMgr =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ niri ];

      systemd.tmpfiles.rules = [
        "L+ /usr/share/wayland-sessions/niri.desktop - - - - ${pkgs.niri}/share/wayland-sessions/niri.desktop"
        "L+ /etc/systemd/user/niri.service - - - - ${pkgs.niri}/share/systemd/user/niri.service"
        "L+ /etc/systemd/user/niri-shutdown.target - - - - ${pkgs.niri}/share/systemd/user/niri-shutdown.target"
      ];
    };
}
