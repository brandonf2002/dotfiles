vim.lsp.set_log_level('debug')

vim.lsp.start({
  name = 'links_ls',
  cmd = {'/home/brandon/doc/uni/5th_year/diss/links-lsp/_build/default/bin/main.exe', '--stdio'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
  end,
})
