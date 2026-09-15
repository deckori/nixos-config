{ ... }:

{
  flake.nixosModules.jellyfin =
    {
      pkgs,
      lib,
      username,
      ...
    }:

    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
        user = "${username}";
      };

      environment.systemPackages = with pkgs; [
        jellyfin-desktop
        jellyfin
        jellyfin-web
        jellyfin-ffmpeg
      ];
    };
}
