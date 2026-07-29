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


  },

  -- Neovim LSP Configurations
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Configure TexLab
      lspconfig.texlab.setup({
        settings = {
          texlab = {
            -- Disable TexLab's build engine so it does not conflict with VimTeX
            build = {
              executable = "",
              args = {},
              onSave = false,
            },
            -- Disable TexLab's forward search to let VimTeX handle PDF syncing
            forwardSearch = {
              executable = "",
              args = {},
            },
          },
        },
      })
    end,
  },


---------- SLUTT PLUGINS--------------------------------------------------

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

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
