{ ... }:

{
  flake.nixosModules.qbittorrent =
    {
      pkgs,
      lib,
      config,
      ...
    }:

    {
      services.qbittorrent = {
        webuiPort = 9999;
      };

      environment.systemPackages = with pkgs; [
        qbittorrent-nox
        qbittorrent-cli
      ];
    };
}
