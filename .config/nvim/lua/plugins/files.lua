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
            { "<leader>of", "<cmd>Telescope oldfiles<cr>", desc = "Telescope Old Files" },
            { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser" },
            { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
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
        init = function(_, opts)
          require("telescope").setup(opts)
          require("telescope").load_extension "file_browser"
        end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
      "ms-jpq/chadtree",
      build = ":CHADdeps",
      keys = {
        { "<leader>ft", "<cmd>CHADopen<cr>", desc = "Open CHADTree" },
      },
    },
}
