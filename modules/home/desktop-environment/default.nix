{ lib, ... }:

{
  imports = [
    ./lockscreen
    ./swaync
    ./waybar
    ./window-manager
    ./hypridle.nix
    ./packages.nix
    ./swayosd.nix
  ];
}
