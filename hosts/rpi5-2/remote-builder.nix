{ inputs, ... }:

{
  users.users.remotebuild = {
    isSystemUser = true;
    group = "remotebuild";
    useDefaultShell = true;

    openssh.authorizedKeys.keyFiles = [
      "${inputs.secrets}/.ssh/rpi5-remotebuild.pub"
    ];
  };

  users.groups.remotebuild = { };

  nix.settings.trusted-users = [ "remotebuild" ];
}
