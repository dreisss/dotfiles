{ ... }:

{
  users.users.dreisss = {
    isNormalUser = true;
    description = "Davi Reis";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
