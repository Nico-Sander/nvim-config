return {
    "neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile"},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true}
		local on_attach = function(client, bufnr)
		    opts.buffer = bufnr

			-- set Keymaps
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definitions, references

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca",vim.lsp.buf.code_action, opts) -- see available code actions

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn",vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

			-- opts.desc = "Show line diagnostics"
			-- vim.keymap.set("n", "<leader>d", vim.diagnostics.open_float, opts) -- show diagnostics for line

			-- opts.desc = "Go to previous diagnostics"
			-- vim.keymap.set("n", "[d", vim.diagnostics.goto_prev, opts) -- jumpt to previous diagnosticc in buffer

			-- opts.desc = "Go to next diagnostics"
			-- vim.keymap.set("n", "]d", vim.diagnostics.goto_next, opts) -- jumpt to next diagnosticc in buffer

			opts.desc = "Show hover documentation"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- jumpt to next diagnosticc in buffer

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- restart LSP if neccessary

		end

		-- used to enable autocompletion (assign to every lsp sever config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
		    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure All language servers here to work with autocompletion
		--
		-- HTML server
		lspconfig["html"].setup({
		    capabilities = capabilities,
			on_attach = on_attach,
		})

		-- CSS sever
		lspconfig["cssls"].setup({
		    capabilities = capabilities,
			on_attach = on_attach,
		})

		--TAILWINDCSS
		lspconfig["tailwindcss"].setup({
		    capabilities = capabilities,
			on_attach = on_attach,
		})

		-- LUA
		lspconfig["lua_ls"].setup({
		    capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
				    diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
						    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
						    [vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
    end,
}
