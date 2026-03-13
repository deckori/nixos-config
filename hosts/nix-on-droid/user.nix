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

    users.nix-on-droid = {
      imports = [
        ./home.setup.nix
      ];
      home.username = "nix-on-droid";
      home.homeDirectory = "/data/data/com.termux.nix/files/home";
      programs.home-manager.enable = true;
      home.stateVersion = "24.05";
    };
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

  nix.settings.allowed-users = [ "nix-on-droid" ];

  # users.defaultUserShell = pkgs.bash;

  # The following is a workaround that patches an issue created by setting Nushell as the login shell. See: https://wiki.nixos.org/wiki/Nushell
  # programs.bash.interactiveShellInit = # bash
  #   ''
  #     if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
  #       exec nu
  #     fi
  #   '';
}
