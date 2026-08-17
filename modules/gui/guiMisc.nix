{ ... }:

{
  flake.homeModules.guiMisc =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mpv
        picard # Official MusicBrainz tagger
      ];
    };
}
