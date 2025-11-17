return {
	-- Formatter plugin for Neovim
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				python = { "black", stop_after_first = true },
				go = { "gofmt", stop_after_first = true },
				bash = { "shfmt", stop_after_first = true },
				zsh = { "shfmt", stop_after_first = true },
				sh = { "shfmt", stop_after_first = true },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
