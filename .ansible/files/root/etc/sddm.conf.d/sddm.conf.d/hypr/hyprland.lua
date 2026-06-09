hl.env("XCURSOR_THEME", "phinger-cursors-dark")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "phinger-cursors-dark")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- hl.on('hyprland.start', function()
--     hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
--     hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Colloid-Dark-Nord"')
-- end)

hl.config({
    ecosystem = {
        enforce_permissions = false,
        no_update_news = true,
        no_donation_nag = true,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        initial_workspace_tracking = 1,
        disable_watchdog_warning = true,
    },

    input = {
        kb_model = "pc104",
        kb_layout = "it",
        kb_options = "fkeys:basic_13-24",

        numlock_by_default = true,

        repeat_rate = 30,
        repeat_delay = 250,

        follow_mouse = 1,
        accel_profile = "flat",
        sensitivity = 0,
    }

})

hl.monitor({
    output = "desc:ASUSTek COMPUTER INC XG27ACS T1LMTF008132",
    mode = "2560x1440@180.00Hz",
    position = "0x0",
    scale = "1",
    cm = "auto",
    vrr = 3,
    bitdepth = 8,
})
