{
  pkgs,
  pkgs-custom,
  pkgs-unstable,
  ...
}:
{
  home.packages = with pkgs; [
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

  programs.obs-studio.enable = true;

  services.flatpak = {
    packages = [
      "dev.krtirtho.Flemozi"
    ];
  };
}
