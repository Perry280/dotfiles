local M = {}

---@param variables table<string, string>
function M.setup(variables)
    local bind = hl.bind
    local dsp = hl.dsp

    bind('SUPER + T', dsp.exec_cmd(variables.terminal))
    bind('SUPER + B', dsp.exec_cmd(variables.browser))
    bind('SUPER + E', dsp.exec_cmd(variables.fileManager))
    bind('SUPER + R', dsp.exec_cmd(variables.menu))
    bind('SUPER + SHIFT + P', dsp.exec_cmd('hyprpicker'))

    bind('SUPER + F', dsp.window.float())
    bind('SUPER + SHIFT + F', dsp.window.fullscreen({ mode = 'maximized', action = 'toggle' }))
    bind('SUPER + ALT + F', dsp.window.fullscreen({ mode = 'fullscreen', action = 'toggle' }))

    bind('SUPER + P', dsp.window.pseudo())            -- dwindle
    bind('SUPER + Tab', dsp.layout('togglesplit'))    -- dwindle
    bind('SUPER + ALT+ Tab', dsp.layout('swapsplit')) -- dwindle

    bind('SUPER + C', dsp.window.close())
    bind('SUPER + SHIFT + C', dsp.window.kill())

    bind('PRINT', dsp.exec_cmd('hyprshot -m output'))
    bind('SUPER + PRINT', dsp.exec_cmd('hyprshot -m window'))
    bind('SHIFT + PRINT', dsp.exec_cmd('hyprshot -m region'))

    -- Session key binds
    bind(
        'SUPER + ALT + CTRL + SHIFT + S',
        dsp.exec_cmd('hyprshutdown -t "Shutting down..." --post-cmd "systemctl poweroff"')
    )
    bind('SUPER + ALT + CTRL + SHIFT + R', dsp.exec_cmd('hyprshutdown -t "Rebooting..." --post-cmd "systemctl reboot"'))
    bind('SUPER + ALT + CTRL + SHIFT + P', dsp.exec_cmd('hyprshutdown -t "Suspending..." --post-cmd "systemctl suspend"'))
    bind('SUPER + ALT + CTRL + SHIFT + O', dsp.exec_cmd('hyprshutdown')) -- Logout
    bind('SUPER + ALT + CTRL + SHIFT + L', dsp.exec_cmd('hyprlock'))     -- Lock
    -- bind('SUPER + SHIFT + X', dsp.submap('session'))
    -- hl.define_submap('session', function()
    --     bind('S', dsp.exec_cmd('hyprshutdown -t "Shutting down..." --post-cmd "systemctl poweroff"'))
    --     bind('R', dsp.exec_cmd('hyprshutdown -t "Rebooting..." --post-cmd "systemctl reboot"'))
    --     bind('P', dsp.exec_cmd('hyprshutdown -t "Suspending..." --post-cmd "systemctl suspend"'))
    --     bind('O', dsp.exec_cmd('hyprshutdown')) -- Logout
    --     bind('L', dsp.exec_cmd('hyprlock'))     -- Lock
    --     bind('escape', dsp.submap('reset'))
    -- end)

    -- Move focus with mainMod + {h, j, k, l}
    bind('SUPER + h', dsp.focus({ direction = 'left' }))
    bind('SUPER + l', dsp.focus({ direction = 'right' }))
    bind('SUPER + k', dsp.focus({ direction = 'up' }))
    bind('SUPER + j', dsp.focus({ direction = 'down' }))

    bind('SUPER + ALT + h', dsp.window.move({ direction = 'left' }))
    bind('SUPER + ALT + l', dsp.window.move({ direction = 'right' }))
    bind('SUPER + ALT + k', dsp.window.move({ direction = 'up' }))
    bind('SUPER + ALT + j', dsp.window.move({ direction = 'down' }))

    bind('SUPER + CTRL + l', dsp.window.move({ workspace = '+1' }))
    bind('SUPER + CTRL + h', dsp.window.move({ workspace = '-1' }))

    bind('SUPER + SHIFT + l', dsp.focus({ workspace = '+1' }))
    bind('SUPER + SHIFT + h', dsp.focus({ workspace = '-1' }))

    -- bind(
    --     'SUPER + SHIFT + ALT + h',
    --     dsp.window.resize({
    --         x = hl.get_window("activewindow").size.x - 20,
    --         y = hl.get_window("activewindow").size.y,
    --     }),
    --     { repeating = true }
    -- )
    -- bind(
    --     'SUPER + SHIFT + ALT + l',
    --     dsp.window.resize({
    --         x = hl.get_window("activewindow").size.x + 20,
    --         y = hl.get_window("activewindow").size.y,
    --     }),
    --     { repeating = true }
    -- )
    -- bind(
    --     'SUPER + SHIFT + ALT + k',
    --     dsp.window.resize({
    --         x = hl.get_window("activewindow").size.x,
    --         y = hl.get_window("activewindow").size.y + 20,
    --     }),
    --     { repeating = true }
    -- )
    -- bind(
    --     'SUPER + SHIFT + ALT + j',
    --     dsp.window.resize({
    --         x = hl.get_window("activewindow").size.x,
    --         y = hl.get_window("activewindow").size.y - 20,
    --     }),
    --     { repeating = true }
    -- )

    -- bind('SUPER + Q', function()
    --     hl.notification.create({ text = tostring(hl.get_window("activewindow").size.x) ..
    --     " " .. tostring(hl.get_window("activewindow").size.y), duration = 2000 })
    -- end)

    -- Switch workspaces with mainMod + [0-9]
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    for i = 1, 10 do
        local key = i % 10
        bind('SUPER + ' .. key, dsp.focus({ workspace = i }))
        bind('SUPER + SHIFT + ' .. key, dsp.window.move({ workspace = i }))
    end
    -- Example special workspace (scratchpad)
    bind('SUPER + S', dsp.workspace.toggle_special('magic'))
    bind('SUPER + SHIFT + S', dsp.window.move({ workspace = 'special:magic' }))

    -- Scroll through existing workspaces with mainMod + scroll
    bind('SUPER + mouse_down', dsp.focus({ workspace = 'e+1' }))
    bind('SUPER + mouse_up', dsp.focus({ workspace = 'e-1' }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
    bind('SUPER + mouse:272', dsp.window.drag(), { mouse = true })
    bind('SUPER + mouse:273', dsp.window.resize(), { mouse = true })

    -- Laptop multimedia keys for volume and LCD brightness
    bind(
        'XF86AudioRaiseVolume',
        dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'),
        { locked = true, repeating = true }
    )
    bind(
        'XF86AudioLowerVolume',
        dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),
        { locked = true, repeating = true }
    )
    bind(
        'XF86AudioMute',
        dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'),
        { locked = true, repeating = true }
    )
    bind(
        'XF86AudioMicMute',
        dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'),
        { locked = true, repeating = true }
    )
    bind(
        'XF86MonBrightnessUp',
        dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'),
        { locked = true, repeating = true }
    )
    bind(
        'XF86MonBrightnessDown',
        dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'),
        { locked = true, repeating = true }
    )

    -- Requires playerctl
    bind('XF86AudioNext', dsp.exec_cmd('playerctl next'), { locked = true })
    bind('XF86AudioPause', dsp.exec_cmd('playerctl play-pause'), { locked = true })
    bind('XF86AudioPlay', dsp.exec_cmd('playerctl play-pause'), { locked = true })
    bind('XF86AudioPrev', dsp.exec_cmd('playerctl previous'), { locked = true })
end

return M
