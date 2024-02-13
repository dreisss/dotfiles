with import <nixpkgs> { };

stdenvNoCC.mkDerivation rec {
  pname = "zed-mono";
  version = "1.2.0";

  src = fetchzip {
    url = "https://github.com/zed-industries/zed-fonts/releases/download/${version}/zed-mono-${version}.zip";
    stripRoot = false;
    hash = "sha256-k9N9kWK2JvdDlGWgIKbRTcRLMyDfYdf3d3QTlA1iIEQ=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
