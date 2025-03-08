return {
    "williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		 
		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
		    ui = {
				icons = {
				    package_installed = "✓",
				    package_pending = "➜",
                    package_uninstalled = "✗",
				}
			}
		})

		mason_lspconfig.setup({
		    -- list servers for mason to install
			ensure_installed = {
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
		    },
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})
	end,
}

