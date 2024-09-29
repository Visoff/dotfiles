vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

--vim.api.nvim_set_option("clipboard","unnamed")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<C-c>", '"+yg_')

vim.keymap.set("n", "<C-t>", vim.cmd.NERDTreeToggle)

vim.keymap.set("n", "<C-\\>", "<plug>NERDCommenterToggle")

vim.api.nvim_set_keymap('i', '<Right>', '<Right>', { noremap = true })
