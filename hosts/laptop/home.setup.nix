{ pkgs, pkgs-unstable, ... }:

{
  consuetudo.wm.enable = true;
  consuetudo.programs.niri.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  home.packages = with pkgs; [
    ardour
    jellyfin-desktop
    mattermost-desktop
    fluffychat
    beeper
    element-desktop
    pkgs-unstable.cisco-packet-tracer_9 # Go to https://www.netacad.com/resources/lab-downloads?courseLang=en-US to download CiscoPacketTracer822_amd64_signed.deb (If the file name is different, change it to as required by nix). Reason is cuz of:
    /*
            Unfortunately, we cannot download file CiscoPacketTracer822_amd64_signed.deb automatically.
            > Please go to https://www.netacad.com to download it yourself, and add it to the Nix store
            > using either
      Current name
            >   nix-store --add-fixed sha256 CiscoPacketTracer_900_Ubuntu_64bit.deb
            > or
            >   nix-prefetch-url --type sha256 file:///path/to/CiscoPacketTracer_900_Ubuntu_64bit.deb
    */
  ];
}
