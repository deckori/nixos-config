{ pkgs, pkgs-stable, ... }:
{
  home.packages = with pkgs; [
    # Godot
    godot

    # Art
    pkgs-stable.krita
  ];
}
