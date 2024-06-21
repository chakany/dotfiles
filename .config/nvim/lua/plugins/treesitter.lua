return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "rust", "javascript", "typescript", "go", "html", "css", "json", "jsdoc", "make", "markdown", "markdown_inline", "svelte", "yaml"
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            intent = {
                enable = true,
            },
        },
        config = function(_, opts)
            local configs = require("nvim-treesitter.configs")

            configs.setup(opts)
        end,
    }
}
