{
  lib,
  inputs,
  ...
}:
{
  flake.nixosModules.username =
    { ... }:
    {
      options.consuetudo.username = lib.mkOption {
        type = lib.types.str;
        description = "Primary username for all systems";
      };

      config.consuetudo.username = lib.strings.removeSuffix "\n" (
        builtins.readFile "${inputs.secrets}/users/main"
      );
    };

  flake.homeModules.username =
    { ... }:
    {
      options.consuetudo.username = lib.mkOption {
        type = lib.types.str;
        description = "Primary username for all systems";
      };

      config.consuetudo.username = lib.strings.removeSuffix "\n" (
        builtins.readFile "${inputs.secrets}/users/main"
      );
    };
}
