vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.opt.smartindent = true
vim.opt.wrap = false
-- vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- length of time vim waits before calling plugins --
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = 'unnamedplus'

vim.wo.signcolumn = 'yes'

-- Display options for autocomplete --
-- vim.o.autocomplete = true
vim.o.completeopt = 'menuone,noselect,popup,preview'

vim.cmd.colorscheme('modus_vivendi')

vim.wo.foldmethod = 'indent' -- vim.wo.foldmethod = 'expr' to use lsp (finicky)
-- vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldlevelstart = 99
vim.o.winborder = 'rounded'
vim.o.pumborder = 'rounded'
vim.diagnostic.config({
  virtual_lines = false
})
