{ config, ... }:
with config.lib.stylix.colors;
{
  imports = [
    ./layout.nix
    ./animations.nix
    ./window-rules.nix
  ];

  programs.niri.settings.overview.backdrop-color = "${base00}";
}
