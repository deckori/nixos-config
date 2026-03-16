{ ... }:

{
  programs.niri.settings.binds = {
    # Suggested binds for running programs: terminal, app launcher, screen locker.
    "Mod+T".action.spawn = "kitty";
    "Mod+B".action.spawn = "firefox";
    "Mod+Space".action.spawn-sh = "pkill rofi || rofi -show drun";
    "Mod+Shift+W".action.spawn-sh = "pkill -SIGUSR1 waybar";
    "Mod+X".action.spawn-sh = "copyq toggle";
    "Mod+Z".action.spawn-sh = "wlogout -s";
    "Mod+P".action.spawn-sh = "hyprpicker -a";
    "Super+Alt+L".action.spawn = "hyprlock";
    "Ctrl+Alt+period".action.spawn = "dev.krtirtho.Flemozi";

    # You can also use a shell. Do this if you need pipes, multiple commands, etc.
    # Note: the entire command goes as a single argument in the end.
    # kdl syntax:-
    # Mod+T { spawn "bash" "-c" "notify-send hello && exec alacritty"; }
  };
}
