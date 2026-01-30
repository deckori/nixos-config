{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Godot
    godot

    # Art
    krita
  ];
}
