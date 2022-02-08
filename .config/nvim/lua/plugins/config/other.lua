-- =============================================
--              -== Other Cfg ==-
-- =============================================
local g = vim.g


-- {{{ Vim Commentary
vim.g.commenter_comment_empty = false
-- }}}

-- {{{ Vim Match-Up setting
g.loaded_matchit = true
vim.g.matchup_matchparen_singleton = false
g.matchup_matchparen_offscreen = {method= "popup"}
-- g.matchup_delim_stopline = 1500
-- g.matchup_matchparen_stopline = 400
-- }}}

-- {{{ Nvim Surround
require"surround".setup {
  context_offset = 100,
  load_autogroups = false,
  mappings_style = "sandwich",
  map_insert_mode = true,
  quotes = {"'", '"'},
  brackets = {"(", '{', '['},
  pairs = {
    nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
    linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
  },
  prefix = "s"
}
-- }}}
