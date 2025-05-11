--[[
require("obsidian").setup({
    workspaces = {
        {
            path = "~/Personal/notes",
            name = "notes"
        }
    },
    completion = {
        nvim_cmp = true
    },
    mappings = {
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true }
        },
    }
});
]]
