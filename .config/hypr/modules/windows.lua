local M = {}

---@param colorscheme table<string, string>
function M.setup(colorscheme)
    ---@type RosePine
    local c = colorscheme
    hl.config({
        general = {
            gaps_in = 5,
            gaps_out = 10,

            border_size = 2,

            col = {
                active_border = c.rose,
                inactive_border = c.base,
                nogroup_border_active = c.rose,
                nogroup_border = c.base,
            },

            resize_on_border = true,
            hover_icon_on_border = false,

            resize_corner = 3,

            allow_tearing = false,

            layout = 'dwindle',
        },

        decoration = {
            rounding = 5,
            rounding_power = 2,

            active_opacity = 1.0,
            inactive_opacity = 1.0,

            blur = {
                enabled = true,
                size = 4,
                passes = 1,

                popups = true,
                input_methods = true,
            },

            shadow = {
                enabled = true,
                range = 4,
                render_power = 3,
                color = c._nc,
            },
        },

        animations = {
            enabled = true,
        },
    })

    local curve = hl.curve
    curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
    curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
    curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
    curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
    curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
    curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

    local animation = hl.animation
    animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
    animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
    animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
    animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
    animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
    animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
    animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
    animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
    animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
    animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
    animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
    animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
    animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
    animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
    animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
    animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
    animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
end

return M
