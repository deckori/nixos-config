{ ... }:

{
  programs.niri.settings.spawn-at-startup = [
    {
      command = [
        "noctalia-shell"
        "kitty"
        "firefox"
        "thunderbird"
        "beeper"
        "/run/current-system/sw/bin/soteria"
        "copyq"
        "ashell"
        "swayosd-server"
      ];
    }
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
