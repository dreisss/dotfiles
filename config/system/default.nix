{ lib, pkgs, ... }:

let
  file = builtins.readFile;
  trim = lib.strings.trim;
  version = trim (file ../../nixos-version);
in
{
  imports = [
    ./debloat
    ./virtualization
    ./fonts
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  system = {
    stateVersion = version;
    autoUpgrade.enable = true;
  };

  services = {
    printing.enable = true;

    xserver.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  systemd.services.logid = {
    enable = true;
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = lib.getExe pkgs.logiops;
      Restart = "on-failure";
    };
  };

  time = {
    timeZone = "America/Santarem";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  users.users.dreisss = {
    isNormalUser = true;
    description = "Davi Reis";
    extraGroups = [ "networkmanager" "wheel" ];
    linger = true;
  };

  networking = {
    hostName = "dreisss";
    networkmanager.enable = true;
  };
}
