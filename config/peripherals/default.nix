{ ... }:

{
  imports = [ ./logiops.nix ];

  console.keyMap = "br-abnt2";

  services.xserver.xkb = {
    layout = "br,us";
    variant = ",intl";
  };
}
