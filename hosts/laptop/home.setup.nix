{ pkgs, ... }:

{
  consuetudo.wm.enable = true;
  consuetudo.programs.niri.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  home.packages = with pkgs; [
    ardour
  ];
}
