{
  pkgs,
  pkgs-custom,
  pkgs-unstable,
  ...
}:

{
  consuetudo.wm.enable = true;
  programs.hyprlock.enable = false;
  services.hypridle.enable = false;

  gtk.enable = true;

  programs.obs-studio.enable = true;
  programs.zathura.enable = true;
  programs.cava.enable = true;
  programs.kitty.enable = true;

  consuetudo.programs.nemo.enable = true;
  consuetudo.programs.cisco-packet-tracer_9.enable = true;

  services.flatpak = {
    packages = [
    ];
  };

  home.packages = with pkgs; [
    # Game dev
    godot
    #
    # Multimedia Editors
    audacity # Audio
    kdePackages.kdenlive # Video
    gimp # Photos
    darktable # Photos
    inkscape # Art
    krita # Art
    ardour # Music
    pdf4qt # PDF suite
    blender # 3D Modelling
    #
    #   # Chat
    #   mattermost-desktop
    #   fluffychat
    #   element-desktop
    #
    #misc
    imagemagick
    tesseract
    pkgs-custom.sticker-convert
    phototonic
    discord
    thunderbird
    #   flow-control
    #   evince # pdf
    #   bruno
    firefox
    # inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    google-chrome
    #   file-roller # archive
    #   gnome-text-editor # gedit
    #
    #   ## Multimedia Viewers
    #   jellyfin-desktop
    #   kodi-wayland
    gnome-sound-recorder
    gthumb
    feh
    #   obs-cmd
    #   pavucontrol
    #   soundwireserver
    #   video-trimmer
    vlc
    xournalpp
    #
    #   ## Office
    #   rstudio
    libreoffice
    #   gnome-calculator
    #   speedcrunch
    #   geogebra6
    #   logisim-evolution
    #   zotero
    #   kicad
    #
    ## Utility
    dconf-editor
    gnome-disk-utility
    zenity
    freefilesync
    #
    #   ## Level editor
    #   ldtk
    #   tiled
  ];
}
