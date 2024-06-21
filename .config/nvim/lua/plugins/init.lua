return {
  {
      "rcarriga/nvim-notify",
      init = function()
          vim.notify = require("notify")
      end,
  },
  {
      "luisiacc/gruvbox-baby",
      lazy = false,
      priority = 1000,
      config = function()
          require("gruvbox-baby")
          vim.g.gruvbox_baby_background_color = "medium"
          vim.g.gruvbox_baby_telescope_theme = 1
          vim.cmd[[colorscheme gruvbox-baby]]
      end,
  },
  "NTBBloodbath/galaxyline.nvim",
  "nvim-tree/nvim-web-devicons",
}
