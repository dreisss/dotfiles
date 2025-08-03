{ ... }:

let
  buttons = {
    left = "0x50";
    right = "0x51";
    middle = "0x52";
    backward = "0x53";
    forward = "0x56";
    thumb = "0xc3";
    top = "0xc4";
  };

  directions = {
    none = "None";
    right = "Right";
    left = "Left";
    up = "Up";
    down = "Down";
  };

  actionModes = {
    release = "OnRelease";
    interval = "OnInterval";
  };

  actionTypes = {
    keypress = "Keypress";
  };

  # -----
  generalButton = input@{ buttonType ? "Gestures", gestures ? "", ... }: {
    __toString = self: toString ''
      {
        cid: ${input.buttonCID};
        action = {
          type: "${buttonType}";
          gestures: (
            ${gestures}
          );
        };
      },
    '';
  };

  button = button: gestures: {
    __toString = self: toString (generalButton { buttonCID = button; inherit gestures; });
  };

  generalGesture = input@{ actionMode ? actionModes.release, actionType ? actionTypes.keypress, interval ? "100", ... }: {
    __toString = self: toString ''
      {
        direction: "${input.direction}";
        mode: "${actionMode}";
        interval: ${interval};
        action = {
          type: "${actionType}";
          keys: ${input.keys};
        }
      },
    '';
  };

  gesture = direction: keys: { __toString = self: toString (generalGesture { inherit direction keys; }); };
in
{
  environment.etc."logid.cfg".text = ''
    devices: ({
    	name: "MX Master 3S";
    	dpi: 2000;

    	smartshift:	{
    		on: true;
    		threshold: 60;
    	};

    	hiresscroll: {
    		hires: true;
    		invert: false;
    		target: false;
    	};

      thumbwheel: {
        divert: false;
        invert: true;
      };

    	buttons: (
        ${button buttons.forward (
          (gesture directions.none ''[ "KEY_LEFTALT", "KEY_RIGHT" ]'') + # forward
          (gesture directions.right ''[ "KEY_LEFTMETA", "KEY_SPACE" ]'') + # launcher
          (gesture directions.left ''[ "KEY_LEFTMETA" ]'') +
          (gesture directions.up ''[]'') +
          (gesture directions.down ''[]'') 
        )}
        ${button buttons.backward (
          (gesture directions.none ''[ "KEY_LEFTALT", "KEY_LEFT" ]'') + # backward
          (gesture directions.right ''[]'') +
          (gesture directions.left ''[]'') +
          (gesture directions.up ''[]'') +
          (gesture directions.down ''[]'') 
        )}
        ${button buttons.middle (
          (gesture directions.none ''[ "KEY_DELETE" ]'') +
          (gesture directions.right ''[ "KEY_LEFTCTRL", "KEY_LEFTMETA", "KEY_RIGHT" ]'') + # worskpace right
          (gesture directions.left ''[ "KEY_LEFTCTRL", "KEY_LEFTMETA", "KEY_LEFT" ]'') + # worskpace left
          (gesture directions.up ''[ "KEY_LEFTALT", "KEY_TAB" ]'') + # Switch app
          (gesture directions.down ''[ "KEY_LEFTMETA", "KEY_D" ]'')  # Desktop
        )}
        ${button buttons.top (
          (gesture directions.none ''[]'') +
          (gesture directions.right ''[ "KEY_LEFTCTRL", "KEY_TAB" ]'') + # Next tab
          (gesture directions.left ''[ "KEY_LEFTCTRL", "KEY_LEFTSHIFT", "KEY_TAB" ]'') + # Previous tab
          (gesture directions.up ''[ "KEY_LEFTCTRL", "KEY_T", "KEY_L" ]'') + # New tab
          (gesture directions.down ''[ "KEY_LEFTCTRL", "KEY_W" ]'') # Close tab
        )}
        ${button buttons.thumb (
          (gesture directions.none ''[ "KEY_ENTER" ]'') +
          (gesture directions.right ''[ "KEY_LEFTMETA", "KEY_RIGHT" ]'') + # Window to right
          (gesture directions.left ''[ "KEY_LEFTMETA", "KEY_LEFT"] '') + # Window to left
          (gesture directions.up ''[ "KEY_LEFTMETA", "KEY_UP" ]'') + # Window to up
          (gesture directions.down ''[ "KEY_LEFTMETA", "KEY_DOWN" ]'') # Window to down
        )}
    	);
    });
  '';
}
