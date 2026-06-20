require('fzf-lua').setup({
  winopts ={
    treesitter = {
      enabled = false
    },
    preview = {
      flip_columns = 190
    },
  },
  files = {
    formatter = "path.filename_first",
    find_opts = [[-type f \! -path '*/.git/*' \! -path '*/.jj/*' \! -path '**/.rbi']],
    rg_opts = [[--color=never --files -g "!.git" -g "!.jj" -g "!.rbi"]],
  }
})
