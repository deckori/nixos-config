{
  inputs,
  config,
  lib,
  username,
  ...
}:
{
  # This is identical to what nixos installer does in
  # (modulesPash + "profiles/installation-device.nix")

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

  # Don't require sudo/root to `reboot` or `poweroff`.
  security.polkit.enable = true;

  # Allow passwordless sudo from nixos user
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };

  services.tailscale.enable = true;

  # We run sshd by default. Login is only possible after adding a
  # password via "passwd" or by adding a ssh key to ~/.ssh/authorized_keys.
  # The latter one is particular useful if keys are manually added to
  # installation device for head-less systems i.e. arm boards by manually
  # mounting the storage in a different system.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  # allow nix-copy to live system
  nix.settings.trusted-users = [
    "nixos"
    "${username}"
  ];

  # We are stateless, so just default to latest.
  system.stateVersion = config.system.nixos.release;
}
