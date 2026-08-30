-----------------------------
---Konfigurasjonsfil i Luaa
-----------------------------
require("config.options") -- vanlige konfigurasjoner
require("config.stave")  -- satavekontroll
-- -----------------------------------------------------------------------------------------------
-- Plugin
-- -----------------------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
      --HER KOMMER PLUGGINS------------------------------------------------
 { import = "plugins" }, -- alle plugins unntatt Telescope og VimTex er samla i ./lua/plugins/pluglist.lua
---------- SLUTT PLUGINS--------------------------------------------------
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
----- Ikke nytt mellom SLUTT PLUGINS OG HER ---------------

require('lualine').setup {
  options = {
    theme = 'papercolor_light' -- Put your preferred built-in theme name here
  }
}

 vim.cmd([[colorscheme tokyonight-day]])  -- Fargeskjema

 --------------------------
 -- Bindinger og konfigurasjoner.
--------------------------- 
--Latex
local latex_conf = require("config.latex_conf")
-- Neomutt
local nmutt = require("config.nmutt")
-- Telescope
local tele_conf = require("config.tele_conf")
-- Andre
require("config.keys") -- vanlige konfigurasjoner

-----------------------------------------
-- Diverse
----------------------------------------
-- Configure and enable native LSP completion
local lsp = require("config.lsp")
-- Åpner på samme sted som vi slapp
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Open file at the last position it was edited earlier",
  group = vim.api.nvim_create_augroup("RestoreCursorPosition", { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

