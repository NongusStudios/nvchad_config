require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "ols",
    "clangd",
    "lua-language-server",
    "pyright",
    "glsl_analyzer",
    "gopls",
    "rust_analyzer",
    "zls",
    "ts_ls",
    "c3lsp",
    "slangd",
}


vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
