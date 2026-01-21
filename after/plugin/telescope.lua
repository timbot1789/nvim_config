require('telescope').setup {
  defaults = { 
    file_ignore_patterns = {".git/*", "^sorbet/*", "%.rbi$", "%.graphql$" },
    layout_strategy = 'vertical',
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s — %s", tail, path), { { { 1, #tail }, "Constant" } }
    end,
  }
}
require('telescope').load_extension('fzf')
