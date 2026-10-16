{ ... }:

{
  flake.homeModules.close-and-restore-tab-yazi =
    { pkgs, ... }:
    {
      programs.yazi = {
        plugins = {
          close-and-restore-tab = {
            package = pkgs.yaziPlugins.close-and-restore-tab;
            setup = true;
          };
        };
        keymap = {
          mgr.prepend_keymap = [
            {
              on = [ "<C-t>" ];
              run = "plugin close-and-restore-tab restore";
              desc = "Restore the previously closed tab";
            }
          ];
        };
      };
    };
}
