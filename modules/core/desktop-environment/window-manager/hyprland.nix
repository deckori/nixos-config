{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  config = lib.mkIf (config.programs.hyprland.enable) {

    programs.hyprland = {
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg.portal.config.hyprland.default = [
      "gtk"
      "hyprland"
    ];

    hardware.graphics = {
      package = hyprland-pkgs.mesa;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = 1;
      __GL_GSYNC_ALLOWED = 0;
      __GL_VRR_ALLOWED = 0;
      _JAVA_AWT_WM_NONEREPARENTING = 1;
      SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
      DISABLE_QT5_COMPAT = 0;
      GDK_BACKEND = "wayland";
      GDK_SCALE = 1;
      ANKI_WAYLAND = 1;
      DIRENV_LOG_FORMAT = "";
      WLR_DRM_NO_ATOMIC = 1;
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      # QT_QPA_PLATFORM = "xcb";
      QT_QPA_PLATFORM = "wayland;xcb";
      # QT_QPA_PLATFORMTHEME = "qt6ct"; # stylix
      # QT_STYLE_OVERRIDE = "kvantum"; # stylix
      MOZ_ENABLE_WAYLAND = 1;
      WLR_BACKEND = "vulkan";
      WLR_RENDERER = "vulkan";
      WLR_NO_HARDWARE_CURSORS = 1;
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "niri";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GTK_THEME = "Colloid-Green-Dark-Gruvbox";
      GRIMBLAST_HIDE_CURSOR = 0;
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
    };
  };
}
