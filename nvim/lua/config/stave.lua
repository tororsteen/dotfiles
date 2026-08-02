

-- Stavekontroll sav og på med CtrS
vim.keymap.set("n", "<C-s>", function()
    vim.opt.spell = not vim.opt.spell:get()
    print("Spell check: " .. (vim.opt.spell:get() and "Enabled" or "Disabled"))
end, { desc = "Toggle spell check" })
-- Understreking av feilstava ord
vim.api.nvim_set_hl(0, "SpellBad", { fg = "#ff5555", undercurl = true })

-- Understreker hvis ordet skulle hatt stor forbokstav
vim.api.nvim_set_hl(0, "SpellCap", { fg = "#ffb86c", undercurl = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "txt",
  callback = function()
    vim.opt_local.spell = true
  end,
})


