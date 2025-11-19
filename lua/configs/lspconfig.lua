require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "ols",
    "clangd",
    "lua-language-server",
    "rust-analyzer",
    "pyright",
    "glsl_analyzer",
    "gopls",
}

vim.lsp.start({
  name = 'ts_ls',
  cmd = {'typescript-language-server', '--stdio'},
  root_dir = vim.fs.dirname(vim.fs.find({'package.json', 'tsconfig.json'}, { upward = true })[1]),
})

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
