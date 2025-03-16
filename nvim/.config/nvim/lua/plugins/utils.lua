return {
  -- Moving faster when holding j and k for a long time
  {
    "rhysd/accelerated-jk",
    config = function()
      vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
      vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
    end,
  },

  -- Save previous edit session (open files, view, etc.)
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      need = 1,
    },
    config = function()
      require("persistence").setup()

      vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end,
        { desc = "Load the session for the current directory" })
      vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end,
        { desc = "Select a session to load" })

      vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end,
        { desc = "Load the last session" })

      vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end,
        { desc = "Stop Persistence -> session won't be saved on exit" })
    end,
  },

  -- Quickly toggle comments
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup({
        mappings = {
          comment_line = "<leader>c", -- Toggle comment
        },
      })
    end,
  },

  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      {
        -- "<leader>tt",
        "<c-j>",
        function()
          require("toggleterm").toggle()
          -- Optionally force focus
          vim.cmd("startinsert!")
        end,
        desc = "Toggle terminal",
        mode = {"n", "v", "t"},
        noremap = true
      }
    }
  },
}

-- lua print(vim.tbl_get(require("lazy.core.config"), "plugins", "toggleterm.nvim", "_", "loaded"))
-- lua print(vim.tbl_get(require("lazy.core.config"), "plugins", "mini.comment", "_", "loaded"))

