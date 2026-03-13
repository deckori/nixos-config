{ username, ... }:

{
  imports = [
    ./theming.nix
  ];

  stylix = {
    enable = true;
    targets = {
      firefox.profileNames = [ "${username}" ];
      waybar.enable = false;
      rofi.enable = false;
      hyprlock.enable = false;
    };
  };
}
