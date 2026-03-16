{ ... }:

{
  programs.niri.settings.window-rules = [
    {
      # Work around WezTerm's initial configure bug
      matches = [
        { app-id = "^org\\.wezfurlong\\.wezterm$"; }
      ];

      default-column-width = { };
    }

    {
      # Firefox PiP + CopyQ + Flemozi floating
      matches = [
        {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        }
        { app-id = "copyq$"; }
        { app-id = "flemozi$"; }
      ];

      open-floating = true;
    }

    {
      # Block password managers from screen capture
      matches = [
        { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
        { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
      ];

      block-out-from = "screen-capture";
    }

    {
      # Rounded corners for all windows
      geometry-corner-radius = 7;
      clip-to-geometry = true;
    }
  ];
}
