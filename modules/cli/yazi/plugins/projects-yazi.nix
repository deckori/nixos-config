{ ... }:

{
  flake.homeModules.projects-yazi =
    { pkgs, ... }:

    {
      programs.yazi = {
        plugins = {
          projects = pkgs.yaziPlugins.projects;
        };
        keymap = {
          mgr.prepend_keymap = [
            {
              on = [
                "P"
                "s"
              ];
              run = "plugin projects save";
              desc = "Save current project";
            }
            {
              on = [
                "P"
                "S"
              ];
              run = "plugin projects save_last";
              desc = "Save current project to last";
            }
            {
              on = [
                "P"
                "l"
              ];
              run = "plugin projects load";
              desc = "Load project";
            }
            {
              on = [
                "P"
                "P"
              ];
              run = "plugin projects load_last";
              desc = "Load last project";
            }
            {
              on = [
                "P"
                "d"
              ];
              run = "plugin projects delete";
              desc = "Delete project";
            }
            {
              on = [
                "P"
                "D"
              ];
              run = "plugin projects delete_all";
              desc = "Delete all projects";
            }
            {
              on = [
                "P"
                "m"
              ];
              run = "plugin projects 'merge current'";
              desc = "Merge current tab to other projects";
            }
            {
              on = [
                "P"
                "M"
              ];
              run = "plugin projects 'merge all'";
              desc = "Merge current project to other projects";
            }
          ];
        };
      };
    };
}
