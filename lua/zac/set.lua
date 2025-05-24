vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4      -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 4  -- Number of spaces that a <Tab> counts for when editing
vim.opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true

vim.opt.wrap = false


vim.opt.swapfile = false                               -- Disable swap files
vim.opt.backup = false                                 -- Disable backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Set the directory for undo files
vim.opt.undofile = true                                -- Enable persistent undo

vim.opt.hlsearch = false                               -- Disable highlighting of search matches
vim.opt.incsearch = true                               -- Enable incremental search

vim.opt.termguicolors = true                          -- Enable 24-bit RGB color in the terminal

vim.opt.scrolloff = 8                                  -- Keep 8 lines visible above and below the cursor
vim.opt.signcolumn = "yes"                             -- Always show the sign column (for diagnostics, etc.)
vim.opt.isfname:append("@-@")                          -- Include '@' and '-' in filenames

vim.opt.updatetime = 50                                -- Time in milliseconds for triggering events (like CursorHold)

vim.opt.colorcolumn = "80"                             -- Highlight column 80 (typically for line length limits)

