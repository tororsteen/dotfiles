-----------------------------
---Konfigurasjonsfil i Luaa
-----------------------------
---
vim.opt.number = true       -- Linjenr skal vises
vim.opt.mouse = "a"         -- Musa fungerer i terminalen   
vim.opt.showmode = false    -- Behøver ikke å vise hvilket modus vi er i. Det gjør linja
vim.opt.syntax = "on"       -- Gjenkjenner syntaks og fargelegger
vim.opt.spell = true        -- Stavekontroll er på
vim.opt.spelllang = "nb"
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

-- Bruker systemets utklippstavle
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
-- Tabulatorinnstillinger
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

--Setter ledetasten til komma
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- Farger og tekstbryting
vim.opt.termguicolors = true
vim.opt.wrap = true 
vim.opt.linebreak = true 

-- Smart søk med tanke på store bokstaver først i ord
vim.opt.ignorecase = true
vim.opt.smartcase = true

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

    { "folke/todo-comments.nvim", opts = {} }, -- Avhengighet

{
    'nvim-lualine/lualine.nvim', -- Statuslinje
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},

    { "nvim-tree/nvim-tree.lua", opts = {} },  --Filtre, som gamle NedrdTree

    { "folke/tokyonight.nvim", opts = {} },  -- Tema

    {
    "m4xshen/autoclose.nvim",  -- Automatisk avslutning av () o.l.
    config = function()
        require("autoclose").setup()
    end,
    },

{
  "lervag/vimtex", -- Latex ,ll er kompilering og ,lv viser pdf
  lazy = false, -- Do not lazy load!
  init = function()
    -- VimTeX configuration goes here (runs BEFORE the plugin loads)
    vim.g.vimtex_view_method = "zathura" -- e.g., zathura, sioyek, skim
  end,
},


{'nvim-lua/plenary.nvim'},

{
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
},






---------- SLUTT PLUGINS--------------------------------------------------

  },



  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

----- Ikke nytt mellom linjene ---------------

require('lualine').setup {
  options = {
    theme = 'papercolor_light' -- Put your preferred built-in theme name here
  }
}

 vim.cmd([[colorscheme tokyonight-day]])  -- Fargeskjema

-- Filvisning av og på med ,n
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" }) 
-- Bruker Zathura til å vise pdf
vim.g.vimtex_view_method = "zathura"
-- Esc fjerne utheving etter søk
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Configure and enable native LSP completion
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.o.autocomplete = true -- Enable global auto-popup

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
    end
  end,
})

-- Bruker autocomplete i neomutt

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

-- Telescope setup

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




