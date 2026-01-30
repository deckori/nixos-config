{ pkgs, ... }:

{
  programs.ladybird.enable = true;

  environment.systemPackages = [
    pkgs.linux-wifi-hotspot
  ];
}
