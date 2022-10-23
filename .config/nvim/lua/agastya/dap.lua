local dap = require("dap")

dap.adapters.python = {
    type = "executable";
    command = "/usr/bin/python";
    args = { "-m", "debugpy.adapter" };
}

dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    },
}

dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty";
    args = {"-e"};
}
-- dap.defaults.fallback.force_external_terminal = true
-- dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.defaults.fallback.focus_terminal = true

-- nvim-dap includes an omnifunc implementation which uses the active debug
-- session to get completion candidates.
vim.cmd("au FileType dap-repl python require('dap.ext.autocompl').attach()")

local set = vim.keymap.set

set("n", "<F5>", "<cmd>lua require('dap').continue()<CR>")
set("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>")
set("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>")
set("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>")
set("n", "<leader>br", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
set("n", "<leader>Br", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
set("n", "<leader>lp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>")

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("nvim-dap-virtual-text").setup()

