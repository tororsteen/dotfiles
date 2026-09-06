
vim.opt.number = true       -- Linjenr skal vises
vim.opt.mouse = "a"         -- Musa fungerer i terminalen   
vim.opt.showmode = false    -- Behøver ikke å vise hvilket modus vi er i. Det gjør linja
vim.opt.syntax = "on"       -- Gjenkjenner syntaks og fargelegger
vim.opt.spell = true        -- Stavekontroll er på
vim.opt.spelllang = "nb"


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
vim.lsp.document_color.enable(true)

-- Smart søk med tanke på store bokstaver først i ord
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Backspace oppfører seg som i andre teksteditorer
vim.opt.backspace = "indent,eol,start"
