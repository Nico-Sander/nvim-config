vim.g.mapleader = " " -- Setting Space as leader key

-- Copy and Paste from Clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>cp", [["+p]])


-- Buffers -> Navigation in open buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")			-- switch to next buffer
vim.keymap.set("n", "<leader>p", ":bp<cr>")			-- switch to previous buffer
vim.keymap.set("n", "<leader>x", ":bd<cr>")			-- close current buffer

-- Panes -> Navigation between open panes (also file explorer)
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>")			-- move pane focus left
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>")			-- move pane focus right

-- Telescope -> to find files and content
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")	-- find in files
vim.keymap.set("n", "<leader>fc", ":Telescope live_grep<cr>")	-- find content

-- Tree -> File explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")	-- toggle the file explorer

-- Toogle Comments
vim.keymap.set("n", "<leader>#", ":CommentToggle<cr>")		-- toggle comments

-- Completions -> Keymaps in /plugins/nvim-cmp.lua

-- LSP -> Keymaps in /plugins/lsp/lspconfig.lua 
