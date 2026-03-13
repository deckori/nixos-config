{
  pkgs,
  inputs,
  username,
  lib,
  ...
}:
{

  home-manager = {
    sharedModules = [
    ];
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        ;
    };
    backupFileExtension = "hm-backup";
    config = ./home.setup.nix;
  };

  users.users.nix-on-droid = {
    # isNormalUser = true;
    # extraGroups = [
    #   "wheel"
    #   "networkmanager"
    #   "video"
    # ];
    openssh.authorizedKeys.keys = [
      (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/.ssh/access-s25-for-loq.pub"))
    ];
  };

  # users.defaultUserShell = pkgs.bash;

  # The following is a workaround that patches an issue created by setting Nushell as the login shell. See: https://wiki.nixos.org/wiki/Nushell
  # programs.bash.interactiveShellInit = # bash
  #   ''
  #     if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
  #       exec nu
  #     fi
  #   '';
}
