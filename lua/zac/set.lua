vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for when editing
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "css" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files

-- make it cross-platform
local home = os.getenv("HOME") or os.getenv("USERPROFILE")

vim.opt.undodir = home .. "/.vim/undodir" -- Set the directory for undo files
vim.opt.undofile = true -- Enable persistent undo

vim.opt.hlsearch = false -- Disable highlighting of search matches
vim.opt.incsearch = true -- Enable incremental search

vim.opt.termguicolors = true -- Enable 24-bit RGB color in the terminal

vim.opt.scrolloff = 8 -- Keep 8 lines visible above and below the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column (for diagnostics, etc.)
vim.opt.isfname:append("@-@") -- Include '@' and '-' in filenames

vim.opt.updatetime = 300 -- Time in milliseconds for triggering events (like CursorHold)
vim.opt.colorcolumn = "80"
