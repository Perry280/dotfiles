hl.monitor({
    output = "desc:ASUSTek COMPUTER INC XG27ACS T1LMTF008132",
    mode = "2560x1440@180.00Hz",
    position = "0x0",
    scale = "1",
    cm = "auto",
    vrr = 3,
    bitdepth = 8,
})

hl.config({
    input = {
        kb_model = "pc104",
        kb_layout = "it",
        kb_options = "fkeys:basic_13-24", -- caps:swapescape

        numlock_by_default = true,

        repeat_rate = 30,
        repeat_delay = 250,

        follow_mouse = 1, -- 2
        accel_profile = "flat",
        sensitivity = 0,
    }
})
