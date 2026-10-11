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

        pywalfox-native # firefox noctalia theming dep
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
    { ... }:
    {
      programs.firefox.enable = true;
    };
}
