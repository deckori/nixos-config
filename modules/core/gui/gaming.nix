{
  pkgs,
  pkgs-unstable,
  pkgs-custom,
  inputs,
  config,
  lib,
  ...
}:
{
  options.consuetudo.gaming-config.enable = lib.mkEnableOption "Gaming Setup Configurations";

  config = lib.mkIf config.consuetudo.gaming-config.enable {

    programs.steam = {
      enable = true;
      # You can live with steam stable, but unstable is somehow the less error prone experience.
      package = pkgs-unstable.steam;
    };

    programs.gamemode.enable = true;

    programs.opengamepadui = {
      enable = false;
      powerstation.enable = true;
    };

    environment.systemPackages = with pkgs; [
      ryubing
      nsz
      prismlauncher # For minecraft
      boilr
      retroarch
      # (retroarch.override {
      #   cores = with libretro; [
      #     fceumm
      #     gambatte
      #     mgba
      #     snes9x
      #   ];
      # })
      cartridges
      mangohud
      protonup-ng
      ludusavi
      lumafly
      lutris
      bottles
      # support both 32-bit and 64-bit applications
      wineWow64Packages.stable
      winetricks

      ## Utils
      # gamescope
      inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.wine-ge

      ## Minecraft
      # prismlauncher

      ## Cli games
      _2048-in-terminal
      vitetris
      nethack

      ## Celeste
      # celeste-classic
      # celeste-classic-pm

      ## Doom
      # gzdoom
      crispy-doom

      ## Emulation
      sameboy
      snes9x
      # cemu
      # dolphin-emu
    ];

    services.flatpak.packages = [
      "com.github.Matoking.protontricks"
      "io.itch.itch"
      "com.heroicgameslauncher.hgl"
    ];

    services.sunshine = {
      enable = false;
      autoStart = true;
      capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
      openFirewall = true;
    };
  };
}
