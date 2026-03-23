{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    pywalfox-native # Native app used alongside the Pywalfox addon

    # GTK theming dependancies
    adw-gtk3
    nwg-look
    gsettings-desktop-schemas
    dconf

    # Qt theming dependancies
    kdePackages.qt6ct
  ];

  services.flatpak.packages = [
    "org.gtk.Gtk3theme.adw-gtk3"
    "org.gtk.Gtk3theme.adw-gtk3-dark"
  ];

  # Disable in favor of noctalia's applet
  programs.nm-applet.enable = false;
  # Calendar events dependancy
  services.gnome.evolution-data-server.enable = true;
  # Screen recorder plugin dependancy
  programs.gpu-screen-recorder.enable = true;

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
