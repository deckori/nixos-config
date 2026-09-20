{ pkgs-custom, ... }:

{
  flake.homeModules.yaziSettings =
    { ... }:
    {
      home.packages = [
        pkgs-custom.program-chooser
      ];
      programs.yazi.settings = {
        mgr.show_hidden = true;
        opener = {
          edit = [
            {
              run = "tmux new-window \${EDITOR:-vi} \"\$@\"";
              desc = "$EDITOR";
              block = true;
              for = "unix";
            }
            {
              run = "code %*";
              orphan = true;
              desc = "code";
              for = "windows";
            }
            {
              run = "code -w %*";
              block = true;
              desc = "code (block)";
              for = "windows";
            }
          ];

          edit-new = [
            {
              run = "kitty \${EDITOR:-vi} \"\$@\" &";
              desc = "kitty $EDITOR";
              block = true;
              for = "unix";
            }
          ];
          open-xournal = [
            {
              run = "xournalpp \"$@\" &";
              desc = "Open Xournalpp";
              orphan = true;
              block = false;
              for = "unix";
            }
          ];
          open-pdf = [
            {
              run = "zathura \"$@\" &";
              desc = "Open PDF";
              orphan = true;
              block = false;
              for = "unix";
            }
          ];
          program-chooser = [
            {
              run = "program-chooser \"$@\"";
              desc = "program-chooser";
              orphan = true;
              block = false;
              for = "unix";
            }
          ];
        };
        open.append_rules = [
          {
            url = "*.pdf";
            use = "open-xournal";
          }
          {
            url = "*";
            use = "program-chooser";
          }
        ];
        open.prepend_rules = [
          {
            url = "*.pdf";
            use = "open-pdf";
          }
          {
            url = "*.xopp";
            use = "open-xournal";
          }
        ];
      };
    };
}
