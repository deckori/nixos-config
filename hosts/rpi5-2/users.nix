{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.REDACTED = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "testingThep=zza@here";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJTRoiVMNdoS6EOKE40/nQlj4LgBflVdE0pkzzOK3wam REDACTED@laptop"
    ];
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
