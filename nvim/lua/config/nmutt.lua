
local M = {}


vim.api.nvim_create_autocmd("FileType", {
  pattern = "mail",
  callback = function()
    -- .,w,b: completes words from current buffer, windows, and other loaded buffers
    -- k: completes words from dictionary (if spell checking is on)
    vim.opt_local.complete = ".,w,b,k"
    
    -- (Optional) If you have a custom contact script or omnifunc
    -- vim.opt_local.complete:append("o") 
  end,
})

local function hilsen()
   -- Setter inn en hilsen etter cursor
  vim.api.nvim_put({ "Med vennlig hilsen", " ", "Tor Orsteen" }, "l", true, true)
end

-- Binder kommando til Ctrl-h i Insert Mode
vim.keymap.set('i', '<C-h>', hilsen, {
  desc = "Binder kommando til Ctrl-h (Insert Mode)",
  noremap = true,
  silent = true
})



return M
