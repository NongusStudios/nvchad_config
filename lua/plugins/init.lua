return {
    {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
    },
    -- Remove buffer (Text) as a source for nvim-cmp
    {
    "hrsh7th/nvim-cmp",
    opts = {
        sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            --{ name = "buffer" },
        },
    }
    },

    {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    },

    {
    "nvim-tree/nvim-tree.lua",
    opts = {
        filters = {
            custom = { "*.uid" },
        },
    },
    },
}
