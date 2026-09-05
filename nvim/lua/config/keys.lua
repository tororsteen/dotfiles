

-- Filvisning av og på med ,t
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" }) 

-- Esc fjerne utheving etter søk
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Det er noen bindinger i andre moduler
-- /home/tor/dotfiles/nvim/lua/config/latex_conf.lua inneholder bindinger som er spesielle for LaTex
-- /home/tor/dotfiles/nvim/lua/config/nmutt.lua inneholder bindinga Ctrl h for å skrive avsluttende hilsen
-- /home/tor/dotfiles/nvim/lua/config/stave.lua inneholder bindinga Ctrl s for å skru av og på stavekontroll
-- /home/tor/dotfiles/nvim/lua/config/tele_conf.lua inneholder en rekke bindinger for telescope
