-- This file can be loaded by calling `lua require('plugins')` from your init.vim

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
  use 'nvim-tree/nvim-web-devicons'
  use({ 'catppuccin/nvim', as = 'catppuccin',
    config = function()
      vim.cmd('colorscheme catppuccin')
    end
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('mfussenegger/nvim-dap')
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
