{ inputs, ... }:
{
  services.flatpak = {
    enable = true;
    # packages declared in other files
    overrides = {
      global = {
        # Force Wayland by default
        # Context.sockets = [
        #   "wayland"
        #   "!x11"
        #   "!fallback-x11"
        # ];
      };
    };
  };
}
