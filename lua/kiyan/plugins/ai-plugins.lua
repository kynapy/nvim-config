local function toggle_codecompanion_chat()
    local api = vim.api
    for _, win in ipairs(api.nvim_list_wins()) do
        local buf = api.nvim_win_get_buf(win)
        if api.nvim_buf_get_option(buf, "filetype") == "codecompanion" then
            api.nvim_win_close(win, true)
            return
        end
    end
    vim.cmd("CodeCompanionChat")
end

return {
    -- Copilot LSP integration
    {
        "github/copilot.vim",
        dependencies = {
            "copilotlsp-nvim/copilot-lsp",
        },
    },

    -- Code Companion for advanced AI code assistance
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "j-hui/fidget.nvim", -- Display status
            "nvim-lua/plenary.nvim",
        },
        opts = {
            ---@module "codecompanion"
            ---@type CodeCompanion.Config
            adapters = {
                acp = {
                    ollama = function ()
                        return require("codecompanion.adapters").extend("ollama", {
                            schema = {
                                model = {
                                    default = "qwen3-coder",
                                },
                                num_ctx = {
                                    default = 20000,
                                },
                            },
                        })
                    end,
                },
            },
            strategies = {
                chat = {
                    adapter = {
                        name = "copilot",
                        model = "gpt-4.1",
                    },
                },
                inline = {
                    adapter = {
                        name = "copilot",
                        model = "gpt-4.1",
                    },
                }
            },
            opts = {
                log_level = "DEBUG",
            }
        },
        keys = {
            { "<leader>ac", toggle_codecompanion_chat, desc = "Code Companion Chat" },
            { "<leader>ai", "<cmd>CodeCompanion inline<cr>", desc = "Code Companion Inline" },
        }
    },

    -- Markdown rendering in chat buffers
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
    },

    -- For visual diff when using the inline assistance 
    {
        "echasnovski/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    },
}

