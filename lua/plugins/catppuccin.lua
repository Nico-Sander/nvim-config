return {
	-- Load the plugin
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	-- Configure the plugin
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
		})
		-- Load the colorscheme for the changed in setup to take effect
		vim.cmd.colorscheme "catppuccin"
	end
}
