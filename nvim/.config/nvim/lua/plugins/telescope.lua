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
    config = function(_, opts)
      local slow_scroll = function(prompt_bufnr, direction)
        local previewer = require("telescope.actions.state").get_current_picker(prompt_bufnr).previewer
        local status = require("telescope.state").get_status(prompt_bufnr)

        -- Check if we actually have a previewer and a preview window
        if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
          return
        end

        previewer:scroll_fn(1 * direction)
      end

      local full_page_scroll = function(prompt_bufnr, direction)
        local previewer = require("telescope.actions.state").get_current_picker(prompt_bufnr).previewer
        local status = require("telescope.state").get_status(prompt_bufnr)

        -- Check if we actually have a previewer and a preview window
        if type(previewer) ~= "table" or previewer.scroll_fn == nil or status.preview_win == nil then
          return
        end

        local speed = vim.api.nvim_win_get_height(status.preview_win)
        previewer:scroll_fn(speed * direction)
      end

      local defaults = {
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- "ignore_case" | "respect_case" | "smart_case"
                                           -- The default case mode is "smart_case".
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            file_ignore_patterns = {"^.git/"}
          }
        },
        mappings = {
          i = {
            ["<C-n>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(prompt_bufnr)
              full_page_scroll(prompt_bufnr, 1)
            end,
            ["<C-b>"] = function(prompt_bufnr)
              full_page_scroll(prompt_bufnr, -1)
            end,
            ["<C-e>"] = function(prompt_bufnr)
              slow_scroll(prompt_bufnr, 1)
            end,
            ["<C-y>"] = function(prompt_bufnr)
              slow_scroll(prompt_bufnr, -1)
            end,
            ["<C-q>"] = function(...)
              require("telescope.actions").smart_send_to_qflist(...)
              require("telescope.actions").open_qflist(...)
            end,
          },
        },
        path_display = function(path_opts, path)
          path = path:gsub("^" .. vim.env.HOME, "~")
          if type(path_display) == "function" then
            path = path_display(path_opts, path)
          end
          return path
        end,
      }

      local final_opts = vim.tbl_deep_extend("force", defaults, opts or {})

      require("telescope").setup(final_opts)
      
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

