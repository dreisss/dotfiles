with import <nixpkgs> { };

let
  pname = "anytype";
  version = "0.55.5";

  src = pkgs.fetchurl {
    url = "https://anytype-release.fra1.cdn.digitaloceanspaces.com/Anytype-${version}.AppImage";
    sha256 = "07xbf87hhskzbk4d29b8h7prfp7fq047jgk2bd7r7nfiadhbrkdr";
  };

  appimageContents = pkgs.appimageTools.extract { inherit pname version src; };
in
pkgs.appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';
}
