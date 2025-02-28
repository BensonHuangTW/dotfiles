return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local bufferline = require("bufferline")
        local map = vim.keymap.set
        bufferline.setup {
            options = {
                numbers = "ordinal",
            },
        }

        -- Set key bindings that quickly move to buffers
        for i = 1, 9 do
            local desc = string.format("Switch to buffer %d", i)
            map("n", "<leader>" .. i, function()
                require("bufferline").go_to(i, true)
            end, { silent = true, desc = desc })
        end

        map("n", "<leader>$", function()
            require("bufferline").go_to(-1, true)
        end, { silent = true, desc = "Switch to last buffer" })
    end,
  },
  -- Indentation highlights
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    --@module "ibl"
    --@type ibl.config
    opts = {},
    config=true,
  },
  {
    -- Dashboard setup
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local config = require("alpha.themes.theta").config
        local layout = config.layout
        local dashboard = require("alpha.themes.dashboard")
        local buttons = {
            type = "group",
            val = {
              { type = "text", val = "Favorite paths", opts = { hl = "SpecialComment", position = "center" } },
              { type = "padding", val = 1 },
              dashboard.button("o", " Open Oil on current directory", "<cmd>Oil .<CR>"),
              dashboard.button("c", " Nvim Configuration", "<cmd>Oil ~/.config/nvim<CR>"),
            },
            position = "center"
        }

        table.insert(layout, buttons)
        require("alpha").setup(config)
    end,

  },
  {
    -- Highlighting other uses of the word under the cursor
    "RRethy/vim-illuminate",
    config = function()
        require("illuminate").configure()
    end,
  }
}
