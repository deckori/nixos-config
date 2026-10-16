{ self, ... }:

{
  flake.homeModules.firefox =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        pywalfox-native # firefox noctalia theming dep
      ];

      programs.firefox.enable = true;
    };
  flake.homeModules.firefoxSysMgr =
    {
      config,
      pkgs,
      nixgl,
      ...
    }:
    {
      programs.firefox.package = config.lib.nixGL.wrap pkgs.firefox;

      imports = [ self.homeModules.firefox ];

    };
}
