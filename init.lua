vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

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
vim.cmd('colorscheme everforest')

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
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>t", vim.cmd.term)
vim.keymap.set("n", "<leader>wh", vim.cmd.sp)
vim.keymap.set("n", "<leader>wv", vim.cmd.vs)
vim.keymap.set("n", "s", vim.cmd.w)
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }

  }
  use 'feline-nvim/feline.nvim'
  use 'ishan9299/nvim-solarized-lua'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'neanias/everforest-nvim'
  use 'nvim-tree/nvim-web-devicons'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('mfussenegger/nvim-dap')
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }
  use('mxsdev/nvim-dap-vscode-js')
  use('lewis6991/gitsigns.nvim')
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
  use({
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Requiredd
    {'hrsh7th/cmp-buffer'},     -- Required
    {'hrsh7th/cmp-path'},     -- Required
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-nvim-lua'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'rafamadriz/friendly-snippets'},     -- Required
  },
  })
end)


