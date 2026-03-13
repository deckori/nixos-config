{
  inputs,
  pkgs,
  ...
}:

{
  services.gitolite = {
    enableGitAnnex = true;
  };
}
