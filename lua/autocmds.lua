require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

--autocmd("FileType", {
--    pattern = {"*.js", "*.ts"},
--    callback = function()
--        vim.lsp.start({
--          name = 'ts_ls',
--          cmd = {'typescript-language-server', '--stdio'},
--          root_dir = vim.fs.dirname(vim.fs.find({'package.json', 'tsconfig.json'}, { upward = true })[1]),
--        })
--    end,
--})

autocmd("InsertLeave", {
  callback = function()
    if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active then
      require("luasnip").unlink_current()
    end
  end,
})
