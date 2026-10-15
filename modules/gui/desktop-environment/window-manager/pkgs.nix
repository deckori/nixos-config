{ ... }:

{
  flake.homeModules.wmPackages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        wl-clipboard
        nwg-displays
      ];
    };
}
