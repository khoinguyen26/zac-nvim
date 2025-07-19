require("zac.remap")
require("zac.lazy")
require("zac.set")
require("zac.lsp")

-- Set up my and load my "lua/zac/plugins" folder
require("lazy").setup({
    spec = { import = "zac/plugins" },
    -- Configure any other settings here. See the documentation for more details.
    -- automatically check for plugin updates
    checker = { enabled = true },
    change_detection = {
        notify = false
    }
})
