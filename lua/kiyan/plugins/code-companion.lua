return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        strategies = {
            chat = {
                adapter = "ollama",
                model = "qwen3-coder",
            },
        },
        opts = {
            log_level = "DEBUG",
        }
    },
}
