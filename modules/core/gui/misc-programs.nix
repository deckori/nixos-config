{ pkgs, ... }:

{
  programs.ladybird.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [
    miraclecast
    linux-wifi-hotspot
    baobab
  ];
}
