{
  pkgs,
  inputs,
  pkgs-custom,
  pkgs-unstable,
  username,
  lib,
  host,
  ...
}:
{
  home-manager = {
    users.${username} = {
      imports = [
        ../../modules/home
      ]
      ++ lib.optionals (pkgs.stdenv.hostPlatform.system == "x86_64-linux") [
        ../../modules/home/default.laptop.nix
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      programs.home-manager.enable = true;
    };
  };

  users.users = {
    ${username} = {
      isNormalUser = true;
      # doesnt work for some reason
      # hashedPasswordFile = config.sops.secrets.my-password.path;
      initialPassword = (
        lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/passwords/users/main-user")
      );
      description = "${username}";
      extraGroups = [
        "networkmanager"
        "kvm"
        "wheel"
      ];
      shell = pkgs.bash;

      openssh.authorizedKeys.keys = [
        (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/.ssh/rpi5-main-user.pub"))
      ];

    };
  };

  nix.settings.allowed-users = [ "${username}" ];

  users.defaultUserShell = pkgs.bash;

  environment = {
    sessionVariables = {
      EDITOR = "nvim";
    };
    shells = [
      pkgs.bash
    ];
  };
  # The following is a workaround that patches an issue created by setting Nushell as the login shell. See: https://wiki.nixos.org/wiki/Nushell
  # programs.bash.interactiveShellInit = # bash
  #   ''
  #     if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
  #       exec nu
  #     fi
  #   '';
}
