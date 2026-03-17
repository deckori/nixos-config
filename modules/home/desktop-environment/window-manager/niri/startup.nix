{ ... }:

{
  programs.niri.settings.spawn-at-startup = [
    {
      command = [
        "kitty"
        "firefox"
        "thunderbird"
        "beeper"
      ];
    }
    { sh = "env QT_QPA_PLATFORMTHEME=qt5ct noctalia-shell"; }
    { sh = "steam -silent -console"; }
    {
      argv = [
        "gobatmon"
        "-normal-warning-threshold"
        "40"
      ];
    }
  ];
}
