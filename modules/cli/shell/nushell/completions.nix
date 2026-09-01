{ ... }:

{
  flake.homeModules.nushellCompletions =
    { pkgs, ... }:
    {
      programs.nushell.extraConfig =
        let
          aliases =
            let
              alias = name: ''
                source ${pkgs.nu_scripts}/share/nu_scripts/aliases/${name}/${name}-aliases.nu
              '';
            in
            names: builtins.foldl' (prev: str: "${prev}\n${str}") "" (map alias names);

          completions =
            let
              completion = name: ''
                source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
              '';
            in
            names: builtins.foldl' (prev: str: "${prev}\n${str}") "" (map completion names);

          autogen-completions =
            let
              autogen = name: ''
                source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/auto-generate/completions/${name}.nu
              '';
            in
            names: builtins.foldl' (prev: str: "${prev}\n${str}") "" (map autogen names);
        in
        ''
          # nu_scripts aliases
          ${aliases [
            "git"
            "chezmoi"
          ]}

          # nu_scripts custom-completions
          ${completions [
            "git"
            "nix"
            "ssh"
            "bat"
            "man"
            "rg"
            "zoxide"
            "docker"
            "bitwarden-cli"
            "cargo"
            "tar"
            "gh"
            "glow"
            "bat"
          ]}

          ${autogen-completions [
            "nvim"
            "unzip"
            "zip"
            "xz"
            "wget"
            "dd"
            "rsync"
            "gzip"
          ]}

          # Conda integration
          use ${pkgs.nu_scripts}/share/nu_scripts/modules/virtual_environments/nu_conda/nu_conda.nu
          $env.nu_conda = '${pkgs.nu_scripts}/share/nu_scripts/modules/virtual_environments/nu_conda/nu_conda.nu'
        ''
      # This import gives a list error. don't know how to fix
      # ++ lib.optionals (pkgs.stdenv.hostPlatform.system == "x86_64-linux") ''
      #   # Plugins
      #   overlay use ${pkgs-custom.alias-finder-nu}/share/alias-finder/alias-finder.nu
      # ''
      ;

    };
}
