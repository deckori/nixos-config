{ username, ... }:

{
  imports = [
    ./theming.nix
  ];

  stylix = {
    enable = true;
    targets = {
      gtksourceview.colors.enable = false;
      firefox.profileNames = [ "${username}" ];
      waybar.enable = false;
      rofi.enable = false;
      hyprlock.enable = false;
    };
  };
}
