{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.services.qbittorrent.enable {
    services.qbittorrent = {
      webuiPort = 9999;
    };

    environment.systemPackages = with pkgs; [
      qbittorrent-nox
      qbittorrent-cli
    ];
  };
}
