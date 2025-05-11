local function find_brackets(lang)
    local selection_start = vim.api.nvim_win_get_cursor(0)[1]
    while selection_start > 1 do
        local line = vim.api.nvim_buf_get_lines(0, selection_start - 1, selection_start, false)[1]
        if line:match("%s*```%s*" + lang) then
            break
        end
        selection_start = selection_start - 1
    end
    local selection_end = selection_start + 1
    while selection_end > 1 do
        local line = vim.api.nvim_buf_get_lines(0, selection_end - 1, selection_end, false)[1]
        if line == nil then
            selection_end = selection_end - 1
            break
        end
        if line:match("%s*```") then
            break
        end
        selection_end = selection_end + 1
    end
    local lines = vim.api.nvim_buf_get_lines(0, selection_start, selection_end - 1, false)
    return lines
end

--[[
``` py
123
456
789
```
]]

find_brackets("py")
