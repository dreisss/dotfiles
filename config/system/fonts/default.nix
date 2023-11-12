{ pkgs, ... }:

let
  monaspace = with pkgs; stdenv.mkDerivation rec {
    name = "monaspace";
    version = "1.000";

    src = fetchzip {
      url = "https://github.com/githubnext/monaspace/releases/download/v${version}/monaspace-v${version}.zip";
      stripRoot = false;
      hash = "sha256-H8NOS+pVkrY9DofuJhPR2OlzkF4fMdmP2zfDBfrk83A=";
    };

    outputs = [ "out" "woff" ];

    installPhase = ''
      runHook preInstall

      pushd monaspace-v${version}/fonts/
      install -Dm644 otf/*.otf -t $out/share/fonts/opentype
      install -Dm644 variable/*.ttf -t $out/share/fonts/truetype
      install -Dm644 webfonts/*.woff -t $woff/share/fonts/woff
      popd

      runHook postInstall
    '';
  };
in
{
  fonts = {
    fonts = with pkgs; [
      cascadia-code
      monaspace

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
