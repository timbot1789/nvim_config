local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-rails',
  'tpope/vim-commentary',
  'tpope/vim-dispatch',
  'tpope/vim-dadbod',
  'chrisbra/csv.vim',
  'yssl/QFEnter',
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
      "mason-org/mason.nvim",
      opts = {}
  },
  {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
          { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
      },
  },
  'neanias/everforest-nvim',
  'nvim-tree/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',
  { 'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = 'false', build = ':TSUpdate'},
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},

        -- optional picker via telescope
        {"nvim-telescope/telescope.nvim"},
    },
    event = "LspAttach",
    opts = {
     picker = {
          "buffer",
          opts = {
              hotkeys = true,
              hotkeys_mode = "text_diff_based",
              auto_preview = true,
          }
      }
    },
}
})


