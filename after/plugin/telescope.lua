-- NOTE: Install ripgrep to get best search performance: https://github.com/BurntSushi/ripgrep
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input('Grep > ')});
  -- You can send to the qflist with <Ctrl> - q after search
end)
