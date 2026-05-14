{
  lib,
  inputs,
  config,
  ...
}:
{
  options.consuetudo.mainUsername = lib.mkOption {
    type = lib.types.str;
    description = "Primary username for all systems";
  };

  config.consuetudo.mainUsername = lib.strings.removeSuffix "\n" (
    builtins.readFile "${inputs.secrets}/users/main"
  );
}
