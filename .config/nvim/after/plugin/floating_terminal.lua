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
    })

    return {
        buf = buf,
        win = win,
    }
end

local state = {
    buf = -1,
    win = -1,
}
local toggle_terminal = function()
    if vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_close(state.win, true)
    else
        if vim.api.nvim_buf_is_valid(state.buf) then
            state = open_floating_window({ buf = state.buf, win = state.win })
        else
            state = open_floating_window()
        end
        if vim.bo[state.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd.startinsert()
    end
end

vim.keymap.set({"n", "t"}, "<leader>tt", toggle_terminal)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
