{ ... }:

{
  flake.homeModules.yaziGit =
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
          plugin.prepend_fetchers = [
            {
              id = "git";
              url = "*";
              run = "git";
              group = "git";
            }
            {
              id = "git";
              url = "*/";
              run = "git";
              group = "git";
            }
          ];
        };
      };
    };
}
