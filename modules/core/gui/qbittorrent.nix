{ pkgs, ... }:

{
  services.qbittorrent = {
    enable = true;
    webuiPort = 9999;
  };

  environment.systemPackages = with pkgs; [
    qbittorrent-nox
    qbittorrent-cli
    qbittorrent
  ];
}
