

hl.config({
    input = {
        kb_layout  = "no_custom", -- Laster fila /home/tor/.config/xkb/symbols/no_custom
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
			clickfinger_behavior = true, -- Enables 2-finger click for right-click
        tap_to_click = true          -- Enables tapping to click
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
--hl.device({
--    name        = "epic-mouse-v1",
--    sensitivity = -0.5,
--})

hl.env("HYPRCURSOR_THEME", "Nordzy-hyprcursors")
hl.env("HYPRCURSOR_SIZE", "36")
