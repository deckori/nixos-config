{ inputs, ... }:

{
  flake.nixosModules.navidrome =
    {
      pkgs,
      lib,
      laptop,
      ...
    }:
    {
      services.navidrome = {
        enable = true;
        openFirewall = true;
        settings = {
          Address = "0.0.0.0";
          Port = 4533;
          MusicFolder = "/data/music/music";

          Plugins.Enabled = true;

          LastFM = {
            ApiKey = (
              lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/services/LastFM/ApiKey")
            );
            Secret = (
              lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/services/LastFM/Secret")
            );
          };
        };

        plugins = with pkgs.navidromePlugins; [
          listenbrainz-daily-playlist
          discord-rich-presence
        ];
      };
    };
}
