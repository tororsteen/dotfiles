
return {

{
  "lervag/vimtex", -- Latex ,ll er kompilering og ,lv viser pdf
  lazy = false, -- Do not lazy load!
  init = function()
    -- VimTeX configuration goes here (runs BEFORE the plugin loads)
    vim.g.vimtex_view_method = "zathura" -- e.g., zathura, sioyek, skim
  end,
},

}
