return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  	},
	sources = {
		"filesystem",
		"buffers",
		"git_status",
	},
	default_source = "filesystem",
	enable_git_status = true,
	enable_referesh_on_write = true,

    config = function()
        require('neo-tree').setup({
			source_selector = {
				winbar = true,
				statusline = false,
			}
        })
    end,

	opts = {
		filesystem = {
			filtered_items = {
				visible = false,
				hide_gitignored = false,
				hide_dotfiles = false,
				hide_by_name = {
					".github",
					"package-lock.json",
					".changeset",
					"prettierrc.json",
				},
				never_show = {".git"},
			},
		},
	},
}
