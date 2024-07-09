return {
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    opts = {},
  },
  {
      "rcarriga/nvim-notify",
      init = function()
          vim.notify = require("notify")
      end,
  },
  {
      "ellisonleao/gruvbox.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        contrast = "hard",
      },
      config = function(opts)
        require("gruvbox").setup(opts)
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
      end,
  },
  "nvim-tree/nvim-web-devicons",
}
