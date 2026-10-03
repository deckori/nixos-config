{ self, username, ... }:

{
  flake.homeModules.nushell =
    {
      lib,
      pkgs,
      pkgs-custom,
      ...
    }:

    {
      imports = [ self.homeModules.nushellCompletions ];
      programs.nushell = {
        enable = true;
        plugins = with pkgs.nushellPlugins; [
          polars
          gstat
          formats
          query
        ];

        shellAliases.n = "noctalia msg notification-show 'nix update' 'finished'";

        extraConfig = ''
          def ll [] { ls -l | select name mode user group size modified}
          def l [] { ls -al | select name mode user group size modified}

          def --env mkcd [folder: path] {
            mkdir $folder
            cd $folder
          }

          def nufzf [] {
            $in | each {|i| $i | to json --raw}
                | str join "\n"
                | fzf -m
                | lines
                | each {$in | from json}
                | reduce {|it, acc| $acc | append $it }
          }

          $env.Path = ($env.Path
            | append [
              '~/.local/bin',
              '~/.config/nixCats-nvim/result/bin',
              '~/.cargo/bin'
              '/etc/profiles/per-user/${username}/bin/'
            ]
          )

          $env.XDG_CONFIG_HOME = ($env.HOME | path join .config)
        '';

        environmentVariables = {
          EDITOR = "nvim";
          LEDGER_FILE = "~/programs/hledger/finance/hledger.journal";
          SDL_VIDEODRIVER = "wayland,x11";
          SSH_AUTH_SOCK = "/run/user/1000/gnupg/S.gpg-agent.ssh";
          GCM_CREDENTIAL_STORE = "secretservice";
          config.buffer_editor = "nvim";
          config.edit_mode = "vi";
          config.show_banner = false;
        };

      };
      programs.zoxide = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
}
