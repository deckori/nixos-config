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
          MusicFolder = "/data/music/";

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

        plugins = with pkgs.pkgsCross.wasi32.navidromePlugins; [
          listenbrainz-daily-playlist
          discord-rich-presence
        ];
      };

      users.users.navidrome.extraGroups = [ "media" ];

    };
  flake.nixosModules.navidromeSysMgr =
    { lib, ... }:
    {
      options.services.resolved.enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Stub for nixpkgs modules that check it; system-manager doesn't manage resolved.";
      };
    };
}
