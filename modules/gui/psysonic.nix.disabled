{ inputs, ... }:

{
  flake.homeModules.psysonic =
    { pkgs, ... }:
    {
      nix.settings = {
        extra-substituters = [ "https://psysonic.cachix.org" ];
        extra-trusted-public-keys = [
          "psysonic.cachix.org-1:M9cQyQ7tgvUWOQ5Pyt8ozlMoPLtOZir6MfRuTH9/VYA="
        ];
      };
      home.packages = [ inputs.psysonic.packages.${pkgs.stdenv.hostPlatform.system}.psysonic ];
    };
}
