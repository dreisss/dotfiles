# dotfiles

This repository contains my personal dotfiles and setup files.

To utilize this configuration in NixOS, please follow the steps below:

1. Clone the repository to your computer:

```bash
git clone https://github.com/dreisss/dotfiles.git ~/.dotfiles
```

2. Open the main configuration file in your preferred text editor with administrative privileges:

```bash
sudo nano /etc/nixos/configuration.nix
```

3. Locate the `imports` section and append the following line:

```nix
imports = [
  /home/your_username/.dotfiles/config
];
```

4. Ensure to customize all configurations for your specific user: Replace `your_username` with your actual username.

5. Execute the init script to initialize the setup:

```bash
~/.dotfiles/scripts/init.sh
```

6. Rebuild the system to apply the updated configuration:

```bash
sudo nixos-rebuild switch --upgrade
```

7. Reboot the system to activate the changes.
