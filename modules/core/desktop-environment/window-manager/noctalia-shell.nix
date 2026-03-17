{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
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
