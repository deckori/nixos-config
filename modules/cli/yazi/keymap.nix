{ ... }:

{
  flake.homeModules.yaziKeymap =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        ripdrag
      ];

      programs.yazi.keymap = {
        mgr.prepend_keymap = [
          {
            on = "T";
            run = "shell --orphan --confirm kitty";
            desc = "Open terminal at current dir";
          }
          {
            on = "!";
            run = "shell \"\$SHELL\" --block";
            desc = "Open shell here";
          }
          {
            on = "<C-n>";
            run = ''shell 'ripdrag -a "$@" -x 2>/dev/null &' --confirm'';
          }
          {
            on = [
              "g"
              "s"
            ];
            run = "cd /st";
            desc = "go to /st";
          }
          {
            on = [
              "g"
              "r"
            ];
            run = "cd /st/remotes";
            desc = "go to remotes";
          }
          {
            on = [
              "g"
              "t"
            ];
            run = "cd /st/test";
            desc = "go to test dir";
          }
          {
            on = [
              "g"
              "e"
            ];
            run = "cd ~/nixos-config";
            desc = "go sys conf";
          }
          {
            on = [
              "g"
              "n"
            ];
            run = "cd /st/notes/sems/sem6";
            desc = "go notes";
          }
        ];
      };
    };
}
