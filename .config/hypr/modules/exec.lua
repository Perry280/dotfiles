hl.on('hyprland.start', function()
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Rosepine-Dark"')

    hl.exec_cmd('systemctl --user start hyprpolkitagent.service')
    hl.exec_cmd('hyprpaper')
    hl.exec_cmd('quickshell')
end)
