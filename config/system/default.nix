{ lib, ... }:

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

  console.keyMap = "br-abnt2";

  services.xserver.xkb = {
    layout = "br,us";
    variant = ",intl";
  };

  system = {
    stateVersion = version;
    autoUpgrade.enable = true;
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

  time.hardwareClockInLocalTime = true;

  environment.etc."logid.cfg".text = ''
    devices: ({
    	name: "MX Master 3S";
    	dpi: 2000;

    	smartshift:	{
    		on: true;
    		threshold: 60; // how easily scroll change modes
    	};

    	hiresscroll: {
    		hires: false;
    		invert: false;
    		target: false;
    	};

    	buttons: (
    		{
    			cid: 0x56; // Forward button
    			action = {
    				type: "Gestures";
    				gestures: (
    					{
    						direction: "None";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: ["KEY_FORWARD"];
    						}
    					},
    					{
    						direction: "Right";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: ["KEY_LEFTCTRL", "KEY_LEFTMETA", "KEY_RIGHT"];
    						}
    					},
    					{
    						direction: "Left";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: ["KEY_LEFTCTRL", "KEY_LEFTMETA", "KEY_LEFT"];
    						}
    					},
    					{
    						direction: "Up";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: ["KEY_LEFTALT", "KEY_TAB"];
    						}
    					},
    					{
    						direction: "Down";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: ["KEY_LEFTMETA", "KEY_D"];
    						}
    					}
    				);
    			};
    		},
    		{
    			cid: 0x53; // Back button
    			action = {
    				type: "Gestures";
    				gestures: (
    					{
    						direction: "None";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: ["KEY_BACK"];
    						}
    					}
    				);
    			};
    		},
    		{
    			cid: 0xc3; // Gesture button (hold and move)
    			action = {
    				type: "Gestures";
    				gestures: (
    					{
    						direction: "None";
    						mode: "OnRelease";
    						action = {
    							type: "Keypress";
    							keys: [ "KEY_ENTER" ];
    						}
    					}
    				);
    			};
    		},
    		{
    			cid: 0xc4; // Top button
    			action = {
    				type: "Gestures";
    				gestures: (
    					{
    						direction: "None";
    						mode: "OnRelease";
    						action = {
    							type: "ToggleSmartShift";
    						}
    					}
    				);
    			};
    		}
    	);
    });
  '';
}
