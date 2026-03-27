-- Configure diagnostic signs in the gutter
vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  severity_sort = true,
})

-- Minimal LSP on_attach function with essential keybindings
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  -- Essential keybindings
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'LSP: Go to definition' }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'LSP: Hover documentation' }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'LSP: Previous diagnostic' }))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'LSP: Next diagnostic' }))

  -- Optional: manual format with <leader>f
  if client.supports_method('textDocument/formatting') then
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend('force', opts, { desc = 'LSP: Format buffer' }))
  end
end

vim.lsp.config('denols', {
    on_attach = on_attach,
    root_markers = {"deno.json", "deno.jsonc"},
})
vim.lsp.config('ts_ls', {
    on_attach = on_attach,
    root_markers = {"package.json"},
    single_file_support = false,
})

-- gbrowse to paste
vim.keymap.set('n', '<leader>gb', '<cmd>:GBrowse!<cr>', { desc = 'git browse to clipboard' })
vim.keymap.set('v', '<leader>gb', "<cmd>:'<,'>GBrowse!<cr>", { desc = 'git browse to clipboard' })

--[[
-- Setup LSPs correctly instead of using ale
--
--]]
vim.lsp.enable("yamlls")
vim.lsp.enable("bashls")
vim.lsp.enable("denols")
vim.lsp.enable("eslint")
vim.lsp.enable("gitlab_ci_ls")
vim.lsp.enable("golangci_lint_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("markdown_oxide")
vim.lsp.enable("jsonls")
vim.lsp.enable("pyright")
vim.lsp.enable("nixd")
vim.lsp.enable("ruff")
vim.lsp.enable("tsgo")
vim.lsp.enable("uvls")
vim.lsp.enable("luals")

vim.lsp.config("yamlls", {
  on_attach = on_attach,
  settings = { yaml = { keyOrdering = false } }
})

vim.lsp.config["salt-jinja-linter"] = {
    on_attach = on_attach,
    filetypes = { 'sls' },
    cmd = { '/Users/jvoss/.local/bin/salt-jinja-linter', 'language-server' },
--    root_markers = { '.git' },
    settings = {},
}

vim.lsp.enable("salt-jinja-linter")
