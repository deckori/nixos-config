{ pkgs, ... }:

{
  consuetudo.wm.enable = false;
  consuetudo.programs.niri.enable = false;
  programs.hyprlock.enable = false;
  services.hypridle.enable = false;

  # home.packages = with pkgs; [
  # ];
}
