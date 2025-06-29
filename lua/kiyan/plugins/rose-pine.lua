return {
    'rose-pine/neovim',
    name = 'rose-pine',
	config = function()
        local rose_pine = require("rose-pine")

        rose_pine.setup({
            variant = "main",
            enable = {
                terminal = true,
            },

            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },

            highlight_groups = {
                Normal = { bg = "#282c34" },
                NormalNC = { bg = "#282c34" },
            },
        })

	    vim.cmd.colorscheme("rose-pine")
	end
}
