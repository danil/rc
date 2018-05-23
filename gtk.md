# GTK

## dconf

    dconf write /org/gnome/shell/overrides/button-layout "'close,minimize,maximize:'"

## gconf

    gconftool-2 --set /apps/nautilus/desktop/computer_icon_visible --type boolean false
    gconftool-2 --set /desktop/gnome/url-handlers/http/command --type string 'firefox %s'
    gconftool-2 --set /desktop/gnome/url-handlers/https/command --type string 'firefox %s'
    gconftool-2 --set /apps/metacity/general/button_layout --type string 'close,minimize,maximize:'
    gconftool-2 --set /desktop/gnome/shell/windows/button_layout --type string "close,minimize,maximize:"
