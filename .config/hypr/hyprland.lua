---@diagnostic disable: missing-fields

-- local nordic = require("nordic")
local rosepine = require('rose-pine')
local variables = require("modules.variables")

require("modules.env")
require("modules.devices")
require("modules.exec")
require("modules.bind").setup(variables)

require("modules.windows").setup(rosepine)
require("modules.layouts")
require("modules.rules")

-- TODO: autostart
-- TODO: killactive esce da Steam, non minimizza. https://wiki.hypr.land/0.54.0/Configuring/Uncommon-tips--tricks/#minimize-steam-instead-of-killing

hl.config({
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
        disable_splash_rendering = true,

        vrr = 3,
        -- animate_manual_resizes = true,
    },
    ecosystem = {
        no_donation_nag = true,
        enforce_permissions = true,
    }
})


hl.permission({ binary = 'corsair-corsair-k55-rgb-pro-gaming-keyboard', type = 'keyboard', mode = 'allow' })
hl.permission({ binary = 'logitech-g203-lightsync-gaming-mouse-keyboard', type = 'keyboard', mode = 'allow' })
hl.permission({ binary = 'power-button', type = 'keyboard', mode = 'allow' })
hl.permission({ binary = 'power-button-1', type = 'keyboard', mode = 'allow' })
hl.permission({ binary = 'sleep-button', type = 'keyboard', mode = 'allow' })
hl.permission({ binary = 'keyd-virtual-keyboard', type = 'keyboard', mode = 'allow' })
hl.permission({ binary = '.*', type = 'keyboard', mode = 'ask' })

hl.permission({ binary = '/usr/bin/hyprlock', type = 'screencopy', mode = 'allow' })
hl.permission({ binary = '/usr/bin/hyprpicker', type = 'screencopy', mode = 'allow' })

hl.on('hyprland.start', function()
    hl.exec_cmd('dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP')
end)
