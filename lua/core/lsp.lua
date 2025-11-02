vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    function opts(desc) return { desc = desc, buffer = args.buf }; end

    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
      vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts("Go to implementation"))
    end


  -- these will be buffer-local keybindings
  -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts("Show diagnostics in hover windows"))
    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts("Go to value definition"))
    vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts("Go to declaration"))
    vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts("Go to type definition"))
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts("Show all references"))
    vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts("Show type signature"))
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts("Rename symbol"))
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts("Format file"))
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts("Perform code action"))

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      table.insert(client.server_capabilities.completionProvider.triggerCharacters, " ")
      table.insert(client.server_capabilities.completionProvider.triggerCharacters, "\t")
      table.insert(client.server_capabilities.completionProvider.triggerCharacters, "[")

      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
      vim.keymap.set('i', '<c-space>', function() vim.lsp.completion.get(); end, opts("Get autocompletion recommendations"))
    end

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

