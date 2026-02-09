{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "d73842c761f7d7859f3bdd80e4360f09180fad41";
    hash = "sha256-+94WVxOWfVhIEiVNWwnNBRmN+d1kbZCIF10Gjorea9M=";
  };
  #The following does not work
  #patchPhase = ''
  #  find . -type f -name "metadata.desktop" -print0 | xargs -0 sed -i -e 's|ConfigFile=Themes/astronaut.conf|ConfigFile=Themes/pixel_sakura.conf|g'
  #'';
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
