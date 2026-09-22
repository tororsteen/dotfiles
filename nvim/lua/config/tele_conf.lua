
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


---------------------------------------------------------------
--[[
Funksjon for å kunne kopiere filnavn fra Telescope
I Insert Mode, vil Ctrl-y kopiere relativ sti, or Alt-y kopiere filnavnet.
I Normal Mode vil y kopiere relativ sti og Y filnavnet.
]]
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Custom action to copy the selected file path
local function copy_path(prompt_bufnr, mode)
  -- Get the current selection in Telescope
  local entry = action_state.get_selected_entry()
  if not entry then
    print("No selection found")
    return
  end

  -- Determine the path type based on selection type
  -- (Telescope maps paths to either .value or .path depending on the picker)
  local path = entry.path or entry.value
  if type(path) == "table" then
    path = path[1]
  end

  local result = ""
  if mode == "absolute" then
    result = vim.fn.fnamemodify(path, ":p") -- Absolute path
  elseif mode == "relative" then
    result = vim.fn.fnamemodify(path, ":.") -- Relative to CWD
  elseif mode == "filename" then
    result = vim.fn.fnamemodify(path, ":t") -- Just the filename
  end

  -- Copy to the '+' (system clipboard) register
  vim.fn.setreg("+", result)
  -- Also copy to the '"' (default unnamed) register for quick pasting with 'p'
  vim.fn.setreg('"', result)

  -- Close the Telescope prompt buffer
  actions.close(prompt_bufnr)
  print("Copied: " .. result)
end

-- Map this action into your Telescope setup
require("telescope").setup({
  defaults = {
    mappings = {
      i = { -- Insert mode mappings inside Telescope
        ["<C-y>"] = function(prompt_bufnr) copy_path(prompt_bufnr, "relative") end,
        ["<M-y>"] = function(prompt_bufnr) copy_path(prompt_bufnr, "filename") end,
      },
      n = { -- Normal mode mappings inside Telescope
        ["y"] = function(prompt_bufnr) copy_path(prompt_bufnr, "relative") end,
        ["Y"] = function(prompt_bufnr) copy_path(prompt_bufnr, "filename") end,
      },
    },
  },
})


return M
