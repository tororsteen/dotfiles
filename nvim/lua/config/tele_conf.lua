
local M = {}


local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.55,
      },
    },
  },
})



-- Telescope bindinger

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

-- Telescope søke i /home/tor
vim.keymap.set('n', '<leader>ch', function()
    require('telescope.builtin').find_files({ cwd = "~" })
end, { desc = "Search home" })


-- Telescope søke i /home/tor/Latex
vim.keymap.set('n', '<leader>cl', function()
    require('telescope.builtin').find_files({ cwd = "~/Latex" })
end, { desc = "Search home/Latex" })


-- Telescope søke i /home/tor/Dokumenter
vim.keymap.set('n', '<leader>cd', function()
    require('telescope.builtin').find_files({ cwd = "~/Dokumenter" })
end, { desc = "Search home/tor/Dokumenter" })


-- Telescope søke i /home/tor/Dokumenter/C_prog
vim.keymap.set('n', '<leader>cc', function()
    require('telescope.builtin').find_files({ cwd = "~/Dokumenter/C_prog" })
end, { desc = "Search home/tor/Dokumenter/C_prog" })

return M
