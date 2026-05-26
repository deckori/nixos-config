{ ... }:

{
  flake.homeModules.nixOnDroidHome =
    { pkgs, username, ... }:
    {
      home.username = username;
      home.homeDirectory = "/data/data/com.termux/files/home";
      home.stateVersion = "24.05";

      programs.home-manager.enable = true;

      home.packages = with pkgs; [
        # Add home-manager specific packages here
      ];
    };
}
