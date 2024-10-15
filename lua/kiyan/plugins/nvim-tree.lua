return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 35
            },
            filters = {
                dotfiles = true
            }
        })

        -- custom mappings
        vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle" })
        vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus, { desc = "Tree Focus" })
        vim.keymap.set("n", "<leader>tc", vim.cmd.NvimTreeCollapse, { desc = "Tree Collapse" })
        vim.keymap.set("n", "<leader>tr", vim.cmd.NvimTreeRefresh, { desc = "Tree Refresh" })

        -- disabling netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
