{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta
  ];

  home.shellAliases = {
    c = "clear";
    cd = "z";
    man = "BAT_THEME='default' batman";
    tree = "eza --icons --tree --group-directories-first";
    diff = "delta --diff-so-fancy --side-by-side";
  };
}
