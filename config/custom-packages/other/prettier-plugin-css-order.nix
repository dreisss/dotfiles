with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "prettier-plugin-css-order";
  dontBuild = true;

  src = fetchFromGitHub {
    owner = "siilwyn";
    repo = "prettier-plugin-css-order";
    rev = "0948dc87da298ee48fc38c2cfe11d4f5c0fb6b56";
    hash = "sha256-nCMZKIzoDAPPEgp96w/a56j5k44TwJ7E5/wd/IfhDHM=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
