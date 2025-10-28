return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "openai",
				-- model = "claude-sonnet-4-20250514",
				model = "gpt-oss:120b-64k",
			},
			inline = {
				adapter = "openai",
				-- model = "claude-sonnet-4-20250514",
				model = "gpt-oss:120b-64k",
			},
		},
		adapters = {
			http = {
				openai = function()
					return require("codecompanion.adapters.http").extend("openai", {
						url = "https://chathpc.jpl.nasa.gov/api/chat/completions",
						schema = {
							model = {
								default = "gpt-oss:120b-64k",
							},
						},
					})
				end,
			},
		},
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG",
		},
	},
}
