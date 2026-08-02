
local M = {}

local function latex_uthev()
   -- Setter inn \emph{ etter cursor
  vim.api.nvim_put({ "\\emph{"}, "c", true, true)
end

-- Binder kommando til Ctrl-i i Insert Mode
vim.keymap.set('i', '<C-i>', latex_uthev, {
  desc = "Binder kommando til Ctrl-i (Insert Mode)",
  noremap = true,
  silent = true
})

-- Bruker Zathura til å vise pdf
vim.g.vimtex_view_method = "zathura"



return M
