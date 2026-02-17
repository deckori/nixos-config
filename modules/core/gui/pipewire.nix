{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.consuetudo.gui.enable {
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # lowLatency.enable = true;
    };
    hardware.alsa.enablePersistence = true;
    environment.systemPackages = with pkgs; [ pulseaudioFull ];
  };
}
