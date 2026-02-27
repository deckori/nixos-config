{ pkgs, ... }:

{
  services.jellyfin = {
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    jellyfin-desktop
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
