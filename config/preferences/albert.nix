{ ... }: {
  home.file.".config/albert/config".text = ''
    [General]
    frontend=widgetsboxmodel
    hotkey=Meta+Space
    prioritizePerfectMatch=true
    showTray=true
    telemetry=false

    [albert]
    global_handler_enabled=false

    [applications]
    enabled=true
    fuzzy=false
    global_handler_enabled=true
    ignore_show_in_keys=false
    use_exec=false
    use_generic_name=false
    use_keywords=false
    use_non_localized_name=false

    [caffeine]
    enabled=false

    [calculator_qalculate]
    angle_unit=2
    enabled=true
    global_handler_enabled=true

    [chromium]
    enabled=false

    [clipboard]
    enabled=true

    [datetime]
    enabled=false

    [fallback_order]
    1\extension=websearch
    1\fallback=84b99381
    2\extension=websearch
    2\fallback=88d8bdc0
    3\extension=websearch
    3\fallback=a852eb59
    size=3

    [files]
    enabled=true
    fuzzy=false
    global_handler_enabled=true
    paths=@Invalid()

    [pluginregistry]
    fuzzy=false
    global_handler_enabled=false

    [python]
    enabled=true

    [python.color]
    enabled=true

    [python.copyq]
    enabled=false

    [python.kill]
    enabled=true

    [python.locate]
    enabled=false

    [python.tex_to_unicode]
    enabled=false

    [python.unit_converter]
    enabled=false

    [triggers]
    global_handler_enabled=true

    [urlhandler]
    enabled=true
    global_handler_enabled=true
    trigger=url

    [websearch]
    enabled=true
    global_handler_enabled=true
    trigger=search

    [widgetsboxmodel]
    alwaysOnTop=true
    clearOnHide=false
    clientShadow=true
    darkTheme=Default System Palette
    displayScrollbar=false
    followCursor=true
    hideOnFocusLoss=true
    historySearch=true
    itemCount=5
    quitOnClose=false
    showCentered=true
    systemShadow=true

    [widgetsboxmodel-ng]
    alwaysOnTop=true
    clearOnHide=true
    darkTheme=
    displayScrollbar=false
    followCursor=true
    hideOnFocusLoss=true
    historySearch=true
    itemCount=5
    showCentered=true
  '';
}
