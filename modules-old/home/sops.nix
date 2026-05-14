{ username, ... }:

{
  sops = {
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    defaultSopsFile = ../core/secrets/files/secrets.yaml;
    defaultSopsFormat = "yaml";
  };
}
