{ ... }:

{
  flake.nixosModules.guiMisc =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mpv
      ];
    };
}
