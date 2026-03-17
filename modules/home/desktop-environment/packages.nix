{
  pkgs,
  lib,
  inputs,
  username,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      waypaper
      swww
      nwg-displays
      hyprpolkitagent
      gradia
      gobatmon
      grim
      slurp
      wlogout
      wl-clip-persist
      cliphist
      wf-recorder
      glib
      wayland
      direnv
    ]
    ++ lib.optionals (stdenv.hostPlatform.system == "x86_64-linux") [
      inputs.adw-bluetooth.packages.${stdenv.hostPlatform.system}.default
      inputs.hypr-contrib.packages.${stdenv.hostPlatform.system}.grimblast
      inputs.hyprpicker.packages.${stdenv.hostPlatform.system}.hyprpicker
    ];
}
