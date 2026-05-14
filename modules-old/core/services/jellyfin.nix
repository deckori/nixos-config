{
  pkgs,
  config,
  lib,
  username,
  ...
}:

{
  config = lib.mkIf config.services.jellyfin.enable {
    services.jellyfin = {
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
