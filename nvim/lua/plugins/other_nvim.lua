return {
    "rgroli/other.nvim",
    config = function()
require("other-nvim").setup({
    mappings = {
        -- Map from Source (.cpp/.cc) to Header (.h/.hpp)
        {
            pattern = "(.*)%.cpp$",
            target = {
                { target = "%1.h", context = "header" },
                { target = "%1.hpp", context = "header" },
            },
        },
        {
            pattern = "(.*)%.cc$",
            target = {
                { target = "%1.h", context = "header" },
                { target = "%1.hpp", context = "header" },
            },
        },
        -- Map from Header (.h/.hpp) to Source (.cpp/.cc)
        {
            pattern = "(.*)%.h$",
            target = {
                { target = "%1.cpp", context = "source" },
                { target = "%1.cc", context = "source" },
            },
        },
        {
            pattern = "(.*)%.hpp$",
            target = {
                { target = "%1.cpp", context = "source" },
                { target = "%1.cc", context = "source" },
            },
        },
    },
})

        -- Keymaps for quick navigation
        vim.keymap.set("n", "<leader>oo", "<cmd>Other<cr>", { desc = "Open alternative file" })
        vim.keymap.set("n", "<leader>os", "<cmd>OtherSplit<cr>", { desc = "Open alternative in horizontal split" })
        vim.keymap.set("n", "<leader>ov", "<cmd>OtherVSplit<cr>", { desc = "Open alternative in vertical split" })
    end
}

