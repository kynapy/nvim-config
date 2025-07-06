return {
    'https://github.com/lewis6991/gitsigns.nvim',
    config = function ()
        local gitsigns = require('gitsigns')

        gitsigns.setup({
            word_diff = true
        })

        vim.keymap.set('n', '<leader>gb', gitsigns.blame, { desc = "Git Blame" })
        vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = "Git Diff" })

        -- Toggles for gitsigns
        vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = "Git Toggle Current Line Blame" })
        vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_word_diff, { desc = "Git Toggle Word Diff" })
    end
}
