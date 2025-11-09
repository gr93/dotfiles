return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    strategies = {
	    chat = {
	      adapter = "gemini_cli",
	    },
	    inline = {
	      adapter = "gemini",
	    },
	    cmd = {
	      adapter = "gemini",
	    }
    },
    adapters = {
        acp = {
          gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
              commands = {
                default = {
                  "gemini",
                  "--experimental-acp"
                }
              },
              defaults = {
                auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
                timeout = 20000
              }
            })
          end,
       }
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
  },
}
