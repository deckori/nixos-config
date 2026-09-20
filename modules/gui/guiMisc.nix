{ pkgs-custom, ... }:

{
  flake.homeModules.guiMisc =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        brave

        mpv

        # Music
        picard # Official MusicBrainz tagger
        fooyin
        lrcget
        # pkgs-custom.onetagger
        pkgs-custom.simkl-mps
      ];
    };
}
