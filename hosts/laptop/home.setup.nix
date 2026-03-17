{
  pkgs,
  pkgs-custom,
  pkgs-unstable,
  ...
}:

{
  consuetudo.wm.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  gtk.enable = true;

  programs.obs-studio.enable = true;
  programs.zathura.enable = true;
  programs.cava.enable = true;

  consuetudo.programs.nemo.enable = true;
  consuetudo.programs.cisco-packet-tracer_9.enable = true;

  services.flatpak = {
    packages = [
    ];
  };

  home.packages = with pkgs; [
    jellyfin-desktop
    mattermost-desktop
    fluffychat
    beeper
    element-desktop

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
