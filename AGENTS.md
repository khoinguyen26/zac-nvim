# Agent Guidelines for Neovim Configuration

## Build/Lint/Test Commands
- No build commands - this is a Neovim Lua configuration
- Lint: Use Stylua for Lua formatting (`stylua .` if available)
- Test: Test configuration by reloading with `nvim` and `:checkhealth`

## Code Style Guidelines
- **Indentation**: 4 spaces (as per `set.lua:5-8`)
- **Imports**: Use `require()` at top of files, prefer local variables for modules
- **Plugin Structure**: Return table with plugin spec in `lua/zac/plugins/*.lua`
- **Config Functions**: Use `config = function()` for plugin setup
- **Keymaps**: Use `vim.keymap.set()` with descriptive options table
- **Comments**: Use `--` for inline comments, avoid excessive commenting

## Naming Conventions
- **Files**: kebab-case for plugin files (e.g., `nvim-lspconfig.lua`)
- **Variables**: snake_case for Lua variables (`builtin`, `configs`)
- **Functions**: snake_case for function names

## Error Handling
- Prefer Neovim's built-in error handling
- Use `pcall()` for potentially failing operations when necessary
- No explicit error handling in basic plugin configurations

## Architecture
- Main entry: `init.lua` → `lua/zac/lazy.lua`
- Settings: `lua/zac/set.lua` for Neovim options
- Keymaps: `lua/zac/remap.lua` for global keymaps
- Plugins: Individual files in `lua/zac/plugins/` imported via lazy.nvim