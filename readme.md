<img height="45px" src=".github/assets/logo.svg" />

My personal dotfiles and setup files.

To use this configuration in NixOs just follow the guide:

1. Clone the repository to your computer:

```bash
git clone https://github.com/dreisss/dotfiles.git ~/.dotfiles
```

2. Open the main configuration file in the editor:

```bash
sudo nano /etc/nixos/configuration.nix
```

3. Find `imports` section and add this:

```nix
imports = [
  /home/dreisss/.dotfiles/config
];
```

4. Remember to change all configurations to my user to your specific user: Replace `dreisss` for your user name.

5. Now use the init script by running:

```bash
~/.dotfiles/scripts/init.sh
```

6. And rebuild the system to update the configuration:

```bash
sudo nixos-rebuild switch --upgrade
```

7. Now reboot the system to apply changes
