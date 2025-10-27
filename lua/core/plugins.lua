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
    'vhyrro/luarocks.nvim',
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
        rocks = { "magick" },
    },
  },
  {
    '3rd/image.nvim',
    config = function()
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          typst = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "norg" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
      })
    end
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


