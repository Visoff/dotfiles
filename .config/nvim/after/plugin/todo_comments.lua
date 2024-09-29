local todo = require("todo-comments")

vim.keymap.set("n", "<leader>td", function() todo.jump_next() end)

todo.setup()
