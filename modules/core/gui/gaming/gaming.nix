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
      protontricks
      ludusavi
      lumafly
      # support both 32-bit and 64-bit applications
      wineWow64Packages.stable
      winetricks

      ## Utils
      # gamescope
      inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.wine-ge

      ## Minecraft
      # prismlauncher
      (modrinth-app.override {
        jdks = [
          jdk8
          jdk17
          jdk21
          jdk25
        ];
      })

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

    # For hsr
    nix.settings = inputs.aagl.nixConfig; # Set up Cachix
    programs.anime-game-launcher.enable = false; # Adds launcher and /etc/hosts rules
    programs.anime-games-launcher.enable = false;
    programs.honkers-railway-launcher.enable = true;
    programs.honkers-launcher.enable = false;
    programs.wavey-launcher.enable = false;
    programs.sleepy-launcher.enable = false;
  };
}
