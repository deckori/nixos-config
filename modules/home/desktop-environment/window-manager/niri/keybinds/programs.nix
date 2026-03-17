{ ... }:

let
  ipc = "noctalia-shell ipc call";
in
{
  programs.niri.settings.binds = {
    # Suggested binds for running programs: terminal, app launcher, screen locker.
    "Mod+T".action.spawn = "kitty";
    "Mod+B".action.spawn = "firefox";
    # "Mod+Space".action.spawn-sh = "pkill rofi || rofi -show drun";
    "Mod+Space".action.spawn-sh = "${ipc} launcher toggle";
    "Mod+Shift+S".action.spawn-sh = "${ipc} settings toggle";
    "Mod+Shift+C".action.spawn-sh = "noctalia-shell ipc call controlCenter toggle";
    "Mod+X".action.spawn-sh = "noctalia-shell ipc call launcher clipboard";
    # "Mod+X".action.spawn-sh = "copyq toggle";
    "Mod+Z".action.spawn-sh = "${ipc} sessionMenu toggle";
    "Mod+P".action.spawn-sh = "hyprpicker -a";
    "Ctrl+Alt+period".action.spawn = "${ipc} launcher emoji";

    # You can also use a shell. Do this if you need pipes, multiple commands, etc.
    # Note: the entire command goes as a single argument in the end.
    # kdl syntax:-
    # Mod+T { spawn "bash" "-c" "notify-send hello && exec alacritty"; }
  };
}
