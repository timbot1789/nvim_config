-- Key Remaps --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", '<cmd>Vexplore<cr>')
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>ws", vim.cmd.sp)
vim.keymap.set("n", "<leader>wv", vim.cmd.vs)
vim.keymap.set("n", "<leader>wv", vim.cmd.vs)
vim.keymap.set("n", "s", vim.cmd.w)
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Open git status window'});
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files({hidden = true});
end, {desc = '[?] Search for files'})
vim.keymap.set('n', '<leader>qf', function()
  vim.ui.input({prompt = 'Quickfix Command > '}, function(input)
    vim.cmd("cexpr system('" .. input.. "')")
    vim.cmd('copen')
  end)
end)
vim.keymap.set('n', '<leader>ps', function()
  require('telescope.builtin').live_grep();
end)
vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').live_grep();
end)
vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').search_history();
end)
vim.keymap.set('n', '<leader>fl', function()
  require('telescope.builtin').loclist();
end)
vim.keymap.set('n', '<leader>fj', function()
  require('telescope.builtin').jumplist();
end)
vim.keymap.set('n', '<leader>fq', function()
  require('telescope.builtin').quickfix();
end)
vim.keymap.set('n', '<leader>fk', function()
  require('telescope.builtin').keymaps();
end)
vim.keymap.set('n', '<leader>fp', function()
  require('telescope.builtin').planets();
end)
