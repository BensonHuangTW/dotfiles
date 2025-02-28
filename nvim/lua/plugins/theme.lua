return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-lualine/lualine.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme tokyonight-storm]]) -- for tokyonight theme

  --     -- status line style settings
  --     require("lualine").setup()
  --     -- set the line number color to make it more visible
  --     vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666c66", bold = true })
  --     vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666c66", bold = true })
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "nvim-lualine/lualine.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("kanagawa").setup()
      vim.cmd("colorscheme kanagawa-dragon")

      -- status line style settings
      -- set the line number color to make it more visible
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#555555", bold = true })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#555555", bold = true })

      -- make the Visual mode background color more obvious
      vim.api.nvim_set_hl(0, "Visual", { bg = "#555555", ctermbg = "LightGrey" })
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#777777" })
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue").setup()
      require("barbecue.ui").toggle(true)
    end,
  },
}
