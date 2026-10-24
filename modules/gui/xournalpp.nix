{ self, ... }:

{
  flake.homeModules.xournalppBase =
    { ... }:
    {
      xdg.mimeApps = {
        enable = true;
        defaultApplications."application/x-xopp" = "com.github.xournalpp.xournalpp.desktop";
      };
    };

  flake.homeModules.xournalpp =
    { pkgs, ... }:
    {
      imports = [ self.homeModules.xournalppBase ];
      home.packages = with pkgs; [ xournalpp ];
    };

  flake.homeModules.xournalppSysMgr =
    { config, pkgs, ... }:
    {
      imports = [ self.homeModules.xournalppBase ];
      home.packages = [ (config.lib.nixGL.wrap pkgs.xournalpp) ];
    };
}
