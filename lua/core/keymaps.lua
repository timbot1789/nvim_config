-- Key Remaps --
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local telescope = require('telescope.builtin')


vim.keymap.set("n", "<leader>ee", '<cmd>Neotree filesystem reveal float<cr>', { desc = 'Open explorer in current window'})
vim.keymap.set("n", "<leader><leader>", '<cmd>Neotree buffers reveal float<cr>', { desc = 'Open explorer in current window'})
vim.keymap.set("n", "<leader>ws", vim.cmd.sp, { desc = 'New Horizontal split' } )
vim.keymap.set("n", "<leader>wv", vim.cmd.vs, { desc = 'New Vertical split' } )
vim.keymap.set("n", "<leader>s", vim.cmd.wa, { desc = 'Save current document' })
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>g', vim.cmd.Git, { desc = 'Open git status window'});
vim.keymap.set('n', '<leader>qf', function()
  vim.ui.input({prompt = 'Quickfix Command > '}, function(input)
    vim.cmd("cexpr system('" .. input.. "')")
    vim.cmd('copen')
  end)
end, {desc = 'Execute system command, then use results to populate QFList'})
vim.keymap.set('n', '<leader>ff', function()
  telescope.find_files({hidden = true});
end, {desc = 'Search for files'})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Grep over files'})
vim.keymap.set('n', '<leader>fo', telescope.oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>fs', telescope.search_history, { desc = 'find search history' })
vim.keymap.set('n', '<leader>fl', telescope.loclist, { desc = 'Search Loclist' })
vim.keymap.set('n', '<leader>fj', telescope.jumplist, { desc = 'Search jumplist' })
vim.keymap.set('n', '<leader>fq', telescope.quickfix, { desc = 'Search quickfix list' })
vim.keymap.set('n', '<leader>fk', telescope.keymaps, { desc = 'Search all keymaps' })
vim.keymap.set('n', '<leader>fp', telescope.planets, { desc = 'Search all planets' })

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    function opts(desc) return { desc = desc, buffer = event.buf }; end

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts("Show diagnostics in hover windows"))
    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts("Go to value definition"))
    vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts("Go to declaration"))
    vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts("Go to implementation"))
    vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts("Go to type definition"))
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts("Show all references"))
    vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts("Show type signature"))
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts("Rename symbol"))
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts("Format file"))
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts("Perform code action"))
  end
})

vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })
