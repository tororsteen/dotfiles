return {
  -- Modern LSP Engine Initialization
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- For autocompletion capabilities
    },
    config = function()
      -- Fetch capabilities from completion engine
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Using the modern Neovim native configuration bridge 
      -- This automatically pulls defaults from nvim-lspconfig's lsp/texlab template
      vim.lsp.config("texlab", {
        capabilities = capabilities,
        settings = {
          texlab = {
            -- Configure your TeX build pipeline
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              onSave = true, -- Auto-build on file save
              forwardSearchAfter = true,
            },
            -- PDF Viewer Integration (e.g., Zathura, Skim, Evince)
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
            -- Clean compilation junk files automatically
            clean = {
              onSuccess = true,
              artifacts = { "*.aux", "*.bbl", "*.blg", "*.fdb_latexmk", "*.fls", "*.synctex.gz", "*.toc" },
            },
            -- Ignore specific tedious LaTeX warnings
            diagnostics = {
              ignoredPatterns = { "Underfull \\\\hbox", "Overfull \\\\hbox" },
            },
          },
        },
      })

      -- Modern API activation for the server
      vim.lsp.enable("texlab")

      -- Dynamic Keymaps upon attaching TexLab to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "texlab" then
            local opts = { buffer = args.buf, silent = true }
            
            -- Trigger manual LaTeX build
            vim.keymap.set("n", "<leader>lb", "<cmd>TexlabBuild<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX: Build Document" }))
            -- Forward search to PDF viewer
            vim.keymap.set("n", "<leader>lv", "<cmd>TexlabForward<cr>", vim.tbl_extend("force", opts, { desc = "LaTeX: View PDF" }))
          end
        end,
      })
    end,
  },
}

