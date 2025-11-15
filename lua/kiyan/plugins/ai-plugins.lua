return {
    -- Copilot setup 
    {
        "github/copilot.vim",
        dependencies = {
            "copilotlsp-nvim/copilot-lsp",      -- LSP integration
        },
    },

    -- Code Companion for AI code assistance
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "j-hui/fidget.nvim",
        },
        opts = {
            ---@module "codecompanion"
            ---@type CodeCompanion.Config
            adapters = {
                acp = {
                    ollama = function()
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

                    -- Alternative adapter for local Ollama
                    -- adapter = {
                    --     name = "ollama",
                    --     model = "qwen3-coder",
                    -- }

                },
                inline = {
                    adapter = {
                        name = "copilot",
                        model = "gpt-4.1",
                    },

                    -- Alternative adapter for local Ollama
                    -- adapter = {
                    --     name = "ollama",
                    --     model = "qwen3-coder",
                    -- }

                },
            },
            display = {
                chat = {
                    -- show_references = true,
                    -- show_header_separator = false,
                    -- show_settings = false,
                    icons = {
                        tool_success = "󰸞 ",
                    },
                    fold_context = true,
                },
            },
            opts = {
                log_level = "DEBUG",
            }
        },
        keys = {
            { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion Chat" },
        },
    },

    -- Markdown rendering in chat buffers
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" },
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
