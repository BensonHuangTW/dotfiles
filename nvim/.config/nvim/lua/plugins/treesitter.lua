return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Based on https://github.com/nvim-treesitter/nvim-treesitter#modules
    -- We can use config = function() { .. }
    -- and paste the code of link above to the config function.
    -- But from https://lazy.nvim/#spec#spec-setup, we can also use
    -- `main` to specify the main entry `"nvim-treesitter.configs"`
    -- and then pass `opts` as its arguments.

    dependencies = {
      -- Handy plugin for defining your own text objects in Vim
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    -- This line is recommended by TreeSitter doc
    -- Please make sure that all installed parsers are updated to the latest version.
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",

    opts = {
      ensure_installed = { "bash", "c", "cpp", "lua", "python" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },

      -- TreeSitter Text Objects
      -- Reference: https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-select
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings
            -- (used in the desc parameter of vim.keymap.set)
            -- which plugins like which-key display.
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
        },

        -- You can choose the select mode (default is charwise 'v')
        -- Can also be a function which gets passed a table with the keys:
        -- - query_string eg '@function.inner'
        -- - selection_mode eg 'v' or 'V'
        -- - and should return the mode ('v', 'V', or '<c-v>') or a table mapping query_strings to modes.
        selection_modes = {
          ["@parameter.outer"] = "v", -- Charwise
          ["@function.outer"] = "V",  -- Linewise
          ["@class.outer"] = "<c-v>", -- Blockwise
        },

        -- If you set this to `true` (default is `false`), then any text object is extended
        -- to include preceding or succeeding whitespace. Succeeding whitespace has priority 
        -- in order to act similarly to e.g. the built-in `ap`.
        include_surrounding_whitespace = false,
      },
    },
  },
}

