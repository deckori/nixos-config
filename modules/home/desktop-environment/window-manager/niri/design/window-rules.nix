{ ... }:

{
  programs.niri.settings.window-rules = [
    {
      matches = [
        { app-id = "^org\\.wezfurlong\\.wezterm$"; }
      ];
      default-column-width = { }; # leave it empty for client-decided width
    }

    {
      matches = [
        {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        }
        { app-id = "flemozi$"; }
      ];
      open-floating = true;
    }

    {
      matches = [
        { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
        { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
      ];
      block-out-from = "screen-capture";
    }

    {
      geometry-corner-radius = {
        top-left = 7.0;
        top-right = 7.0;
        bottom-left = 7.0;
        bottom-right = 7.0;
      };
      clip-to-geometry = true;
    }
  ];
}
