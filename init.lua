require("keymaps")		-- Import File where key mappings are defined 	~/.config/nvim/lua/keymaps.lua
require("options")		-- Import File where vim options are defined 	~/.config/nvim/lua/options.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup( { {import = "plugins"}, {import = "plugins/lsp"} } ) -- Load all plugin files and the lsp plugin folder

-- Open file explorer on startup
-- vim.cmd("NvimTreeOpen")
