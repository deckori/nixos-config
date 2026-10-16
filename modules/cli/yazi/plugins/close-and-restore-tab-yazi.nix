{ ... }:

{
  flake.homeModules.close-and-restore-tab-yazi =
    { pkgs, ... }:
    {
      programs.yazi = {
        plugins = {
          git = {
            package = pkgs.yaziPlugins.git;
            setup = true;
          };
        };
        settings = {
          plugin.prepend_keymap = [
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
