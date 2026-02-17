{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.consuetudo.gui.enable {
    programs.ladybird.enable = true;
    programs.kdeconnect.enable = true;

    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    environment.systemPackages = with pkgs; [
      miraclecast
      linux-wifi-hotspot
      baobab
      protonvpn-gui
    ];
  };
}
