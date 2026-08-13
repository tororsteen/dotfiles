
hl.config({
    plugin = {
        hyprbars = {
            -- Title bar height
            bar_height = 30,

            -- Title bar background colors (Hex format RRGGBAA)
            ["col.text"] = "0xffffffff",
            bar_color = "0x1f1f1fff",

            -- Title font styling
            bar_text_font = "Sans",
            bar_text_size = 14,
            bar_text_align = "center",

            -- Layout and behavior
            bar_part_of_window = true,
            bar_precedence_over_border = true,
        }
    }
})

