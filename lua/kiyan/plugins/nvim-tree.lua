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
        vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
        vim.keymap.set("n", "<leader>ft", vim.cmd.NvimTreeFocus)

        -- disabling netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
