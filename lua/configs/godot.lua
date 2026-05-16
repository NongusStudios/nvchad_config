-- Configuration from https://simondalvai.org/blog/godot-neovim/

-- paths to check for project.godot file
local paths_to_check = {'/', '/../'}
local is_godot_project = false
local godot_project_path = ''
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for _, value in pairs(paths_to_check) do
    if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
        is_godot_project = true
        godot_project_path = cwd .. value
        break
    end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
-- start server, if not already running
if is_godot_project and not is_server_running then
    vim.fn.serverstart(godot_project_path .. '/server.pipe')
end

if is_godot_project then
    -- GD Scipt Config
    local gdscript_port = os.getenv "GDScript_Port" or "6005"
    local gdscript_cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(gdscript_port))
    vim.lsp.config("gdscript", {
        cmd = gdscript_cmd,
        filetypes = { "gd", "gdscript" },
        root_markers = { "project.godot", ".git" }
    })

    vim.lsp.enable({
        "gdscript",
        "gdshader"
    })

    -- write breakpoint to new line
    vim.api.nvim_create_user_command('GodotBreakpoint', function()
        vim.cmd('normal! obreakpoint' )
        vim.cmd('write' )
    end, {})
    vim.keymap.set('n', '<leader>rb', ':GodotBreakpoint<CR>')

    -- delete all breakpoints in current file
    vim.api.nvim_create_user_command('GodotDeleteBreakpoints', function()
        vim.cmd('g/breakpoint/d')
    end, {})
    vim.keymap.set('n', '<leader>rd', ':GodotDeleteBreakpoints<CR>')

    -- search all breakpoints in project
    vim.api.nvim_create_user_command('GodotFindBreakpoints', function()
        vim.cmd(':grep breakpoint | copen')
    end, {})
    vim.keymap.set('n', '<leader>rf', ':GodotFindBreakpoints<CR>')

    -- append "# TRANSLATORS: " to current line
    vim.api.nvim_create_user_command('GodotTranslators', function(_)
        vim.cmd('normal! A # TRANSLATORS: ')
    end, {})
end
