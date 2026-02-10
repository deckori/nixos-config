{
  config,
  inputs,
  lib,
  username,
  pkgs,
  ...
}:

{
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
