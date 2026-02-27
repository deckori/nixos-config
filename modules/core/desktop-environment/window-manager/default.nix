{ lib, ... }:

{
  options.consuetudo.wm.enable = lib.mkEnableOption "Desktop environment packages";

  imports = [
    ./hyprland.nix
    ./niri.nix
  ];
}
