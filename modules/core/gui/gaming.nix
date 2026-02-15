{
  pkgs,
  pkgs-unstable,
  pkgs-custom,
  inputs,
  ...
}:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  programs.steam = {
    enable = true;
    # You can live with steam stable, but unstable is somehow the less error prone experience.
    package = pkgs-unstable.steam;
  };

  programs.gamemode.enable = true;

  programs.opengamepadui = {
    enable = true;
    powerstation.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pkgs-custom.ryubing
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
    heroic
    bottles
    # support both 32-bit and 64-bit applications
    wineWow64Packages.stable
    winetricks

    ## Utils
    # gamemode
    # gamescope
    # winetricks
    # inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.wine-ge

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
  ];
}
