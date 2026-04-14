require("nvchad.configs.lspconfig").defaults()

-- GD Scipt Config
local port = os.getenv "GDScript_Port" or "6005"
local cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port))
vim.lsp.config("gdscript", {
    cmd = cmd,
    filetypes = { "gd", "gdscript" },
    root_markers = { "project.godot", ".git" }
})

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
    "just",
    "gdscript",
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
