{ ... }:

{
  programs.niri.settings.spawn-at-startup = [
    {
      command = [
        "kitty"
        "firefox"
        "thunderbird"
        "beeper"
        "/run/current-system/sw/bin/soteria"
        "ashell"
        "swayosd-server"
      ];
    }
    { sh = "env QT_QPA_PLATFORMTHEME=qt5ct noctalia-shell"; }
    { sh = "steam -silent -console"; }
    {
      argv = [
        "waypaper"
        "--restore"
      ];
    }
    {
      argv = [
        "gobatmon"
        "-normal-warning-threshold"
        "40"
      ];
    }
  ];
}
