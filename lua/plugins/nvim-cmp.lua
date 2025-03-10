return {
    "hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",			-- source for text in buffer
		"hrsh7th/cmp-path",				-- source for file system paths
		"L3MON4D3/LuaSnip",				-- snippet engine
		"saadparwaiz1/cmp_luasnip", 	-- for autocompletion
		"rafamadriz/friendly-snippets"	-- usefule snippets
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
		    completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
				    luasnip.lsp_expand(args.body)
			    end,
			},
		    -- Keymappings for navigating suggestions and completions
		    mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false}),
		    }),
			-- Sources for suggestions, completions and snippets (order is important)
			sources = cmp.config.sources({
				{ name = "nvim_lsp"},
				{ name = "buffer"},
				{ name = "path"},
				{ name = "luasnip"},
			}),
		})
    end,

}
