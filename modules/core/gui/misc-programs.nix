{ pkgs, ... }:

{
  programs.ladybird.enable = true;

  environment.systemPackages = with pkgs; [
    linux-wifi-hotspot
    baobab
  ];
}
