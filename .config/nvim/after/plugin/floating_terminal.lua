local open_floating_window = function(opts)
    local opts = opts or {}

    local width = opts.width or vim.o.columns * 0.8
    local height = opts.height or vim.o.lines * 0.8

    local buf = nil
    if opts.buf then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = math.floor(width),
        height = math.floor(height),
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal",
        border = "rounded",
        title = "Terminal (" .. opts.n .. ")",
    })

    return {
        buf = buf,
        win = win,
    }
end

local state = {
    bufs = {},
    win = -1,
}
local toggle_terminal = function(n)
    if vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_close(state.win, true)
    else
        local s
        if state.bufs[n] and vim.api.nvim_buf_is_valid(state.bufs[n]) then
            s = open_floating_window({ buf = state.bufs[n], win = state.win, n = n })
        else
            s = open_floating_window({ n = n })
        end
        state.bufs[n] = s.buf
        state.win = s.win
        if vim.bo[state.bufs[n]].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd.startinsert()
    end
end

vim.keymap.set({"n", "t"}, "<leader>tt", function() toggle_terminal(1) end)
vim.keymap.set({"n", "t"}, "<leader>t1", function() toggle_terminal(1) end)
vim.keymap.set({"n", "t"}, "<leader>t2", function() toggle_terminal(2) end)
vim.keymap.set({"n", "t"}, "<leader>t3", function() toggle_terminal(3) end)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
