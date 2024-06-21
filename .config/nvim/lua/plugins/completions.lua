return {
    {
        "ms-jpq/coq_nvim",
        branch = "coq",
        build = ":COQdeps",
        cmd = "COQnow",
        lazy = false,
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up",
            }
        end,
    },
    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
        lazy = false,
    },
}
