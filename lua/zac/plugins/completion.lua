return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
        keymap = {
            preset = "default"
        },
        completion = {
            documentation = { auto_show = true },
            list = {
                selection = {
                    auto_insert = false,
                },
            },
            ghost_text = {
                enabled = true,
            },
        },
    },
}
