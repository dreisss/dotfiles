with import <nixpkgs> { };

let
  pname = "capacities";
  version = "1.46.1";
  src = pkgs.fetchurl {
    url = "https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-${version}.AppImage";
    sha256 = "0z4x1vg79lxwln7d3ayc706dych2znyjw330pwsjz5f8pp419icg";
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
