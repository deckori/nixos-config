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

      programs.pidgin = {
        enable = true;
        plugins = with pkgs.pidginPackages; [
          pidgin
          pidgin-latex
          purple-googlechat
        ];
      };
    };

  flake.nixosModules.guiMiscNixos =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [

        # Image editors
        # gimp
        # darktable
        # inkscape

        # krita # Drawing
        # blender # 3D Modelling

      ];
    };
}
