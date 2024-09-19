vim.opt.termguicolors = true
require("core.plugins")
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = true 
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false 

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = 'unnamedplus'

vim.wo.signcolumn = 'yes'

vim.o.completeopt = 'menuone,noselect'

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd('colorscheme everforest')
vim.cmd('set iskeyword-=_')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Key Remaps --

vim.g.mapleader = " "
vim.g.terminal_emulator='kitty'
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree )
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>ws", vim.cmd.sp)
vim.keymap.set("n", "<leader>wv", vim.cmd.vs)
vim.keymap.set("n", "<leader>wv", vim.cmd.vs)

vim.keymap.set("n", "s", vim.cmd.w)
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Open git status window'});
vim.keymap.set('n', '<leader>ff', function() 
  require('telescope.builtin').find_files({hidden = true});
end, {desc = '[?] Search for files'})
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  require('telescope.builtin').grep_string({search = vim.fn.input('Grep > ')});
end)

