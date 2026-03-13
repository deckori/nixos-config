{
  inputs,
  lib,
  ...
}:

{
  services.taskchampion-sync-server = {
    openFirewall = true;
    allowClientIds = [
      (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/client-info/taskwarrior"))
    ];
  };
}
