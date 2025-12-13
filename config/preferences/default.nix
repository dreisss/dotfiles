{ ... }:

{
  imports = [
    <plasma-manager/modules>
  ];

  home.file.".XCompose".text = ''
    include "%L"

    <dead_acute> <C> : "Ç"
    <dead_acute> <c> : "ç"
  '';

  programs.plasma = {
    enable = true;

    # maclike apps bar in the middle
    # natural scrolling in touchpad

    fonts = {
      general = {
        family = "Geist";
        pointSize = 12;
      };
    };
  };
}
