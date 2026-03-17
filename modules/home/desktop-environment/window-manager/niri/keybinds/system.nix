{ ... }:

let
  ipc = "noctalia-shell ipc call";
in
{
  programs.niri.settings.binds = {
    # Example volume keys mappings for PipeWire & WirePlumber.
    # kdl syntax
    # The  property makes them work even when the session is locked.
    # XF86AudioRaiseVolume allow-when-locked=false { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
    # XF86AudioLowerVolume allow-when-locked=false { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
    # XF86MonBrightnessUp  allow-when-locked=false { spawn-sh "brightnessctl set 5%+"; }
    # XF86MonBrightnessDown allow-when-locked=false { spawn-sh "brightnessctl set 5%-"; }
    # Mod+XF86MonBrightnessUp  allow-when-locked=false { spawn-sh "brightnessctl set 100%"; }
    # Mod+XF86MonBrightnessDown allow-when-locked=false { spawn-sh "brightnessctl set 0%"; }
    # XF86AudioMute        allow-when-locked=false { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
    # XF86AudioMicMute     allow-when-locked=false { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

    "XF86AudioRaiseVolume".action.spawn-sh = "swayosd-client --output-volume raise";
    "XF86AudioLowerVolume".action.spawn-sh = "swayosd-client --output-volume lower";
    "XF86AudioMute".action.spawn-sh = "swayosd-client --output-volume mute-toggle";
    "XF86AudioMicMute".action.spawn-sh = "swayosd-client --input-volume mute-toggle";

    "XF86AudioPlay".action.spawn-sh = "swayosd-client --playerctl play-pause";
    "XF86AudioNext".action.spawn-sh = "swayosd-client --playerctl next";
    "XF86AudioPrev".action.spawn-sh = "swayosd-client --playerctl previous";

    "XF86MonBrightnessUp".action.spawn-sh = "swayosd-client --brightness raise";
    "XF86MonBrightnessDown".action.spawn-sh = "swayosd-client --brightness lower";

    "Alt+XF86AudioRaiseVolume".action.spawn-sh = "swayosd-client --output-volume +1";
    "Mod+Alt+WheelScrollUp".action.spawn-sh = "swayosd-client --output-volume +1";

    "Alt+XF86AudioLowerVolume".action.spawn-sh = "swayosd-client --output-volume -1";
    "Mod+Alt+WheelScrollDown".action.spawn-sh = "swayosd-client --output-volume -1";

    "Alt+XF86MonBrightnessUp".action.spawn-sh = "swayosd-client --brightness +1";
    "Alt+XF86MonBrightnessDown".action.spawn-sh = "swayosd-client --brightness -1";

    "Super+Alt+L".action.spawn = "${ipc} lockScreen lock";
    "Mod+S".action.spawn-sh = "${ipc} sessionMenu lockAndSuspend";
    "Mod+M".action.spawn-sh = "${ipc} systemMonitor toggle";
  };
}
