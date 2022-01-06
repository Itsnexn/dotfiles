-- =============================================
--             -== TreeSitter ==-
-- =============================================

local tsc = require"nvim-treesitter.configs"

tsc.setup({
  use_languagetree = true,
  ensure_installed = {
      "bash",
      "lua",
      "python",
      "c",
      "cpp",
      "html",
      "css",
      "json",
      "yaml",
  },
   highlight = {
      enable = true,
   matchup = {
     enable = true,         -- mandatory, false will disable the whole extension
     },
   },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  }
})
