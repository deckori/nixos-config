{ ... }:

{
  flake.homeModules.gamingSysMgr =
    {
      pkgs,
      inputs,
      config,
      lib,
      ...
    }:
    {

      programs.steam = {
        enable = true;
        package = (config.lib.nixGL.wrapOffload pkgs.steam);
      };

      # programs.gamemode = {
      #   enable = true;
      # };
      #
      # programs.opengamepadui = {
      #   enable = false;
      #   powerstation.enable = true;
      # };
      #
      # environment.systemPackages = with pkgs; [
      #   ryubing
      #   nsz
      #   boilr
      #   retroarch
      #   # (retroarch.override {
      #   #   cores = with libretro; [
      #   #     fceumm
      #   #     gambatte
      #   #     mgba
      #   #     snes9x
      #   #   ];
      #   # })
      #   cartridges
      #   mangohud
      #   protonup-ng
      #   protontricks
      #   ludusavi
      #   lumafly
      #   # support both 32-bit and 64-bit applications
      #   wineWow64Packages.stable
      #   winetricks
      #
      #   flightcore
      #
      #   ## Minecraft
      #   prismlauncher
      #   (modrinth-app.override {
      #     jdks = [
      #       jdk8
      #       jdk17
      #       jdk21
      #       jdk25
      #     ];
      #   })
      # ];
      # services.sunshine = {
      #   enable = false;
      #   autoStart = true;
      #   capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
      #   openFirewall = true;
      # };

    };
}
