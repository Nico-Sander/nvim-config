vim.opt.nu =	 			true	-- enable line numbers
vim.opt.relativenumber = 	true	-- enable relative line numbers
vim.opt.tabstop =	 		4		-- set tab-width to 4 space
vim.opt.shiftwidth = 		4		-- 4 spaces for indent width
vim.opt.autoindent = 		true	-- copy indent from current line when starting new one

-- Serach settings
vim.opt.ignorecase = 		true	-- ignore case when searching
vim.opt.smartcase = 		true	-- assume case-sensitive when searching with mixed case

-- Color settings
vim.opt.termguicolors = 	true 	
vim.opt.background = 		"dark" 	-- colorscheme that have light and dark versions will use dark
vim.opt.signcolumn = 		"yes"	-- show sign column so that text doesn't shift

-- Backspace
vim.opt.backspace = "indent,eol,start"	-- allow backspace on indent, end of line or insert mode start position

-- Clipboard
vim.opt.clipboard:append("unnamedplus")	-- use system clipboard as default register

-- Split windows
vim.opt.splitright = 		true 	-- split vercial windows to the right
vim.opt.splitbelow = 		true 	-- split horizontal windows to the bottom

-- Swap file
vim.opt.swapfile = 			false	-- Turn off swap file

-- Disable autocomment new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

