{ username, ... }:

{
  flake.nixosModules.shell =
    { pkgs, ... }:

    {
      environment = {
        systemPackages = with pkgs; [
          pciutils
          nushell
        ];
        pathsToLink = [
          "/share/bash-completion"
        ];
      };

      programs.bash = {
        enable = true;
        completion.enable = true;
      };

      environment.etc."shells".text = ''
        /run/current-system/sw/bin/nu
        ${pkgs.nushell}/bin/nu
      '';
    };
  flake.homeModules.shell =
    { ... }:
    {
      home.sessionPath = [
        "$HOME/.config/nixCats-nvim/result/bin"
        "/etc/profiles/per-user/${username}/bin/"
        "/usr/local/MATLAB/R2026b/bin/"
      ];

      home.shell = {
        enableNushellIntegration = true;
        enableBashIntegration = true;
      };

      home.shellAliases = {
        n = "noctalia msg notification-show 'nix update' 'finished'";
      };
    };
}
