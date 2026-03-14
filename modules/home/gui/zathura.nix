{ username, ... }:

{
  programs.zathura = {
    options = {
      selection-clipboard = "clipboard";
      recolor = true;
    };
  };
}
