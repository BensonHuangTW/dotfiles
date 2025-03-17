-- make the modification of .vimrc effective immediately
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("$MYVIMRC"),
  command = "source " .. vim.fn.expand("$MYVIMRC")
})

-- allow local config file in the project directory
vim.opt.exrc = true

-- appearance setting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.splitright = true -- put the new window on the right (i.e. :vsplit file1.txt)
vim.opt.splitbelow = true -- put new horizontal windows below
vim.cmd([[highlight WinSeparator guifg=#4a4a4a]]) -- Adjust the color (#4a4a4a is a medium gray) - make the terminal window separator

-- search setting
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- highlight search results as typing
vim.opt.hlsearch = false -- highlight all search result
vim.opt.incsearch = true

-- indent setting
vim.opt.tabstop = 2 -- set the tab to 2 spaces
vim.opt.expandtab = true -- use spaces characters when pressing tab
vim.opt.shiftwidth = 2 -- number of indentation
vim.opt.autoindent = true -- automatically indent when adding a new line
vim.opt.smartindent = true -- make indent based on code syntax

-- commands
vim.opt.wildmenu = true -- show the autocomplete options for command-line mode.

-- MISC
vim.opt.title = true -- show the edited file status (e.g. if modified) in the window title
vim.opt.swapfile = false
vim.opt.mouse = "a" -- enable use of mouse
vim.opt.exrc = true -- enable .lua config specific to the current work directory

-- ========================================================================
-- |                          Key bindings                                |
-- ========================================================================
vim.keymap.set("i", "jk", "<Esc>", {noremap = true, silent = true, desc="<Esc>"})
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<C-w>Q', 
  [[:windo if &buftype != '' | close | endif<CR>]], 
  {noremap = true, silent = true, desc = 'Close all window of non-regular file buffers (e.g. plugings).'})

-- System Clipboard
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "v", "n" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })


-- ========================================================================
-- |                          New Commands                                |
-- ========================================================================
vim.api.nvim_create_user_command('Bd', function()
  vim.cmd('bp|bd #')
end, {})
