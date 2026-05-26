{ ... }:

{
  flake.homeModules.laptopHome =
    { pkgs, ... }:
    {
      # consuetudo.wm.enable = true;
      programs.hyprlock.enable = false;
      services.hypridle.enable = false;

      gtk.enable = true;

      programs.obs-studio.enable = true;
      programs.zathura.enable = true;
      programs.cava.enable = true;
      programs.kitty.enable = true;

      # consuetudo.programs.nemo.enable = true;

      home.packages = with pkgs; [
        godot
        audacity
        kdePackages.kdenlive
        gimp
        darktable
        inkscape
        krita
        ardour
        blender
        imagemagick
        tesseract
        evtest
        phototonic
        discord
        vesktop
        gemini-cli
        claude-code
        thunderbird
        firefox
        google-chrome
        gnome-sound-recorder
        gthumb
        feh
        vlc
        xournalpp
        libreoffice
        dconf-editor
        gnome-disk-utility
        zenity
        freefilesync
      ];
    };
}
