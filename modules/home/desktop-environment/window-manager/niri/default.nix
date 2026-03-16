{ ... }:

{
  imports = [
    ./niri.nix
    ./noctalia-shell.nix
  ];

  programs.niri.settings.screenshot-path = "";
}
