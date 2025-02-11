with import <nixpkgs> { };

let
  pname = "capacities";
  version = "1.45.11";
  src = pkgs.fetchurl {
    url = "https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-${version}.AppImage";
    sha256 = "0f1ffr5khdnzdxfismhii4jz5m2ylwsfmhymdv8h9wjly2sg2nma";
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
