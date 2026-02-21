{ ... }:

{
  # The following convert the laptop's co-pilot key into a normal right control key
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        /*
          See the keyboard ID and key ID by using the following:
          # systemctl stop keyd # U need to stop keyd for the following to work
          # keyd monitor -t
        */
        ids = [ "048d:c996:e1dedece" ];
        settings = {
          main = {
            "leftshift+leftmeta+f23" = "rightcontrol"; # copilot = right control
          };
          otherlayer = { };
        };
      };
    };
  };
}
