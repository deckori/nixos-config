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

      # consuetudo.programs.nemo.enable = true;

      home.packages = with pkgs; [
        # godot # game engine

        # Audio
        # audacity
        # ardour

        # kdePackages.kdenlive #video editor

        # Image editors
        # gimp
        # darktable
        # inkscape

        # krita
        # blender
        imagemagick
        tesseract
        # evtest
        # phototonic

        # discover-overlay
        # (discover-overlay.override {
        #   python3 = pkgs.python3.override {
        #     packageOverrides = self: super: {
        #       setuptools = super.setuptools_80;
        #     };
        #   };
        # })
        (discord.override {
          # withOpenASAR = true; # can do this here too
          withVencord = true;
        })
        thunderbird
        gnome-sound-recorder
        gthumb
        feh
        vlc
        libreoffice
        dconf-editor
        gnome-disk-utility
        freefilesync
      ];
    };
}
