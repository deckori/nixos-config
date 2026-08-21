{ pkgs-custom, ... }:

{
  flake.homeModules.guiMisc =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mpv

        # Music
        picard # Official MusicBrainz tagger
        fooyin
        lrcget
        pkgs-custom.onetagger
      ];
    };
}
