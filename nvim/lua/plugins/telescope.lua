return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      }
    },
    config = function()
      -- Setting up telescope fzf
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      require("telescope").setup {
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- "ignore_case" | "respect_case" | "smart_case"
                                           -- The default case mode is "smart_case".
          }
        }
      }

      require("telescope").load_extension("fzf")
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope recent files ('_ for repeat')" })

      -- Additional configuration options for live grep
      vim.keymap.set("n", "<leader>/", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end, { desc = "[/] Search in Open Files" })
    end
  }
}

