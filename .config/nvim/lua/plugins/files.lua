return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help Tags" },
        },
        opts = {
            defaults = {
                borderchars = {
                    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                    results = { " " },
                    preview = { " " },
                },
            },
        },
    }
}
