{ self, ... }:

{
  flake.homeModules.yazi =
    {
      inputs,
      pkgs,
      pkgs-custom,
      ...
    }:

    {
      programs.yazi = {
        enable = true;
        # package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
        package = pkgs.yazi;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
        plugins = {
          sudo = pkgs.yaziPlugins.sudo;
        };
        shellWrapperName = "y";
      };

      # programs.nushell.extraConfig = ''
      #   def --env y [...args] {
      #     let tmp = (mktemp -t "yazi-cwd.XXXXXX")
      #     ^yazi ...$args --cwd-file $tmp
      #     let cwd = (open $tmp)
      #     if $cwd != "" and $cwd != $env.PWD {
      #       cd $cwd
      #     }
      #     rm -fp $tmp
      #   }
      # '';
      imports = [
        self.homeModules.yaziSettings
        self.homeModules.yaziKeymap

        # Plugins
        self.homeModules.yaziGit
        self.homeModules.yaziLazygit
        self.homeModules.yaziRestore
        self.homeModules.yaziSmart-enter
        self.homeModules.yaziSudo
      ];
    };
}
