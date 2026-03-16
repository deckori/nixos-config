{ ... }:

{
  imports = [
    ./niri.nix
    ./noctalia-shell.nix
    ./design
    ./keybinds
  ];

  programs.niri.settings.screenshot-path = "";
}
