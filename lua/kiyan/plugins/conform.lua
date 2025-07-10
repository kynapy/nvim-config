return {
    'stevearc/conform.nvim',
    opts = {},
    config = function ()
        require("conform").setup({
            lua = { 'stylua' },
            javascript = { 'prettier', 'eslint', 'ts_ls', stop_after_first = true },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function (args)
                require("conform").format({ bufnr = args.buf })
            end
        })

    end
}
