return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = {
			preset = "default",
			manual = {
				["<C-Space>"] = "open", -- Triggers the completion menu manually
			},
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
