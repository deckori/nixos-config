{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Godot
    godot

    # Drawing
    krita
  ];
}
