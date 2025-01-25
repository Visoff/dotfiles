require("pomodoro").setup({
    keymaps = {
        task_done = "<CR>",
        timer_pause = "t",
        make_task = "n",
    },
    cycles = {20*60, 10*60, 20*60, 10*60, 20*60, 20*60}
})
