{ ... }:

{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "kitty" ]; }
    { command = [ "firefox" ]; }
    { command = [ "thunderbird" ]; }
    { command = [ "beeper" ]; }
    { sh = "env QT_QPA_PLATFORMTHEME=qt5ct noctalia-shell"; }
    { sh = "steam -silent -console"; }
    { sh = [ "gobatmon -normal-warning-threshold 40" ]; }
  ];
}
