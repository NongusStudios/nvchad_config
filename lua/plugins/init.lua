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

    --{ "L3MON4D3/LuaSnip", enabled = false },
    --{ "saadparwaiz1/cmp_luasnip", enabled = false },
}
