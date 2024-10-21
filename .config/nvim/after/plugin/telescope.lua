local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fbf', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
