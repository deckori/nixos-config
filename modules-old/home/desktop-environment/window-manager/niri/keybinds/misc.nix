{ ... }:

{
  programs.niri.settings.binds = {
    # Mod-Shift-/, which is usually the same as Mod-?,
    # shows a list of important hotkeys.
    # "Mod+Shift+Slash".action.show-hotkey-overlay;

    "Print".action.screenshot.show-pointer = false;
    "Ctrl+Print".action.screenshot-screen.show-pointer = false;
    "Alt+Print".action.screenshot-window = [ ];

    # Applications such as remote-desktop clients and software KVM switches may
    # request that niri stops processing the keyboard shortcuts defined here
    # so they may, for example, forward the key presses as-is to a remote machine.
    # It's a good idea to bind an escape hatch to toggle the inhibitor,
    # so a buggy application can't hold your session hostage.
    #
    # The allow-inhibiting=false property can be applied to other binds as well,
    # which ensures niri always processes them, even when an inhibitor is active.
    "Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = [ ];

    # The quit action will show a confirmation dialog to avoid accidental exits.
    "Mod+Shift+E".action.quit = [ ];
    "Ctrl+Alt+Delete".action.quit = [ ];

    # Powers off the monitors. To turn them back on, do any input like
    # moving the mouse or pressing any other key.
    "Mod+Shift+P".action.power-off-monitors = [ ];
  };
}
