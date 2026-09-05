
return {
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

    { "elkowar/yuck.vim" }

}
 -- Disse har egne filer under /lua/plugins/pluglist.lua
    -- gitsigns.lua
    -- lsp.lua
    -- neogit.lua
    -- nvim-cmp.lua
    -- other_nvim.lua
    -- telescope.lua
    -- vimtex.lua
