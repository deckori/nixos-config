{ inputs, ... }:

{
  flake.nixosModules.navidrome =
    {
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
          LastFM = {
            ApiKey = (
              lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/services/LastFM/ApiKey")
            );
            Secret = (
              lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/services/LastFM/Secret")
            );
          };
        };
      };
    };
}
