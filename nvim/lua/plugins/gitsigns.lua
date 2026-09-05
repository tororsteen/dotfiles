return{
{
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup{
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation through hunks
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr})

        -- Actions
        vim.keymap.set('n', '<leader>hs', gs.stage_hunk)
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
        vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end)
      end
    }
  end
}
}
