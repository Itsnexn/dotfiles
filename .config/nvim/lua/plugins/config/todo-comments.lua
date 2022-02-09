-- =============================================
--           -== TODO Comments ==-
-- =============================================
local todo_comments = require("todo-comments")
local colors = require("tokyonight.colors").setup({})

todo_comments.setup({
  signs = true,
  sign_priority = 8,

  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      -- signs = false,
    },
    TODO = { icon = " ", color = "info" },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  merge_keywords = true,

  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "fg", -- "fg", "bg", "wide" or empty.
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- Vim regex
    comments_only = true,
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", colors.red },
    info  = { "DiagnosticInfo", colors.green },
    hint  = { "DiagnosticHint", colors.blue2 },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]],
  },
})
