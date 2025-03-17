return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "permissions",
          "mtime",
        },
        win_options = {
          -- wrap = false,
          -- signcolumn = "no",
          -- cursorcolumn = false,
          -- foldcolumn = "0",
          -- spell = false,
          -- list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
      })

      -- key binding for open file explorer
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "oil: toggle float view" })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          adaptive_size = true,
          relativenumber = true,
        },
        update_focused_file = {
          enable = true,
          update_root = {
            enable = false,
            ignore_list = {},
          },
          exclude = false,
        },
        renderer = {
          indent_width = 1,
          indent_markers = {
            enable = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "├",
            },
          },
        },
      })

      -- make focus highlight more visible
      vim.cmd([[
        highlight NvimTreeCursorLine guibg=#555555
      ]])

      vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree."} )
      vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", { desc = "Focus on nvim-tree"} )
    end
  }
}

