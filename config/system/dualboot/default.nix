{ ... }:

{
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    useOSProber = true;
  };
}
