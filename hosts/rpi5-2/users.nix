{
  config,
  inputs,
  lib,
  username,
  pkgs,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "testingThep=zza@here";
    openssh = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      authorizedKeys.keys = [
        (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/.ssh/rpi5-main-user.pub"))
      ];
    };
  };
  # Use less privileged nixos user
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    # Allow the graphical user to login without password
    # initialHashedPassword = "";
  };
}
