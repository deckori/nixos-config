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

    "XF86AudioRaiseVolume".action.spawn-sh = "${ipc} volume increase";
    "Mod+Alt+WheelScrollUp".action.spawn-sh = "${ipc} volume increase";

    "XF86AudioLowerVolume".action.spawn-sh = "${ipc} volume decrease";
    "Mod+Alt+WheelScrollDown".action.spawn-sh = "${ipc} volume decrease";

    "XF86AudioMute".action.spawn-sh = "${ipc} volume muteOutput";
    "XF86AudioMicMute".action.spawn-sh = "${ipc} volume muteInput";

    "XF86AudioPlay".action.spawn-sh = "${ipc} media playPause";
    "XF86AudioNext".action.spawn-sh = "${ipc} media next";
    "XF86AudioPrev".action.spawn-sh = "${ipc} media previous";

    "XF86MonBrightnessUp".action.spawn-sh = "${ipc} brightness increase";
    "Mod+Ctrl+Alt+WheelScrollUp".action.spawn-sh = "${ipc} brightness increase";
    "XF86MonBrightnessDown".action.spawn-sh = "${ipc} brightness decrease";
    "Mod+Ctrl+Alt+WheelScrollDown".action.spawn-sh = "${ipc} brightness decrease";

    "Super+Alt+L".action.spawn = "${ipc} lockScreen lock";
    "Mod+S".action.spawn-sh = "${ipc} sessionMenu lockAndSuspend";
    "Mod+M".action.spawn-sh = "${ipc} systemMonitor toggle";
  };
}
