{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
  ];
  # programs.thunderbird = {
  #   enable = true;
  #   profiles."REDACTED" = {
  #     search.force = true;
  #     search.default = "ddg";
  #   };
  # };
}
