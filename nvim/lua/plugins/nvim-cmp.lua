return {
  {
    "hrsh7th/nvim-cmp",
    -- Load on InsertEnter so it is ready when you start typing
    event = "InsertEnter", 
    dependencies = {
      -- Core completion source for Neovim's built-in LSP
      "hrsh7th/cmp-nvim-lsp", 
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        -- Your existing cmp configuration goes here
      })
    end,
  },
}

