{ username, ... }:

{
  flake.nixosModules.jellyfin =
    {
      pkgs,
      lib,
      ...
    }:

    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
        user = "${username}";
      };

      environment.systemPackages = with pkgs; [
        jellyfin-web
        jellyfin-ffmpeg
      ];
    };
}
