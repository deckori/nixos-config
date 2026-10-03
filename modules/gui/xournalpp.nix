{ ... }:

{
  flake.homeModules.xournalpp =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ xournalpp ];

      xdg.mimeApps = {
        enable = true;
        defaultApplications."application/x-xopp" = "com.github.xournalpp.xournalpp.desktop";
      };
    };
}
