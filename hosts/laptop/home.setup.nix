{ pkgs, pkgs-unstable, ... }:

{
  consuetudo.wm.enable = true;
  consuetudo.programs.niri.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  programs.obs-studio.enable = true;
  programs.cava.enable = true;
  consuetudo.programs.cisco-packet-tracer_9.enable = true;
  services.flatpak = {
    packages = [
      "dev.krtirtho.Flemozi"
    ];
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

    # Game dev
    godot

    # Music production
    ardour

    # Art
    krita

    #misc
    imagemagick
    pkgs-custom.sticker-convert
    phototonic
    bluez
    bluez-tools
    discord
    copyq # clipboard manager
    thunderbird
    flow-control
    evince # pdf
    bruno
    firefox
    # inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    google-chrome
    file-roller # archive
    gnome-text-editor # gedit

    ## Multimedia
    kodi-wayland
    audacity
    gimp
    inkscape
    kdePackages.kdenlive
    darktable
    gnome-sound-recorder
    pdf4qt
    gthumb
    feh
    blender
    obs-cmd
    pavucontrol
    soundwireserver
    video-trimmer
    vlc
    xournalpp

    ## Office
    rstudio
    libreoffice
    gnome-calculator
    speedcrunch
    geogebra6
    logisim-evolution
    zotero
    kicad

    ## Utility
    dconf-editor
    gnome-disk-utility
    zenity

    ## Level editor
    ldtk
    tiled
  ];
}
