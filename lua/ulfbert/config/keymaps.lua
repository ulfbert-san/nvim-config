vim.g.mapleader = " "

-- Exit 
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Moving Lines
vim.keymap.set("n", "<A-e>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-i>", ":m .-2<CR>==")

-- Dublicate content
vim.keymap.set("n", "<A-d>", ":t.<CR>")

-- Moving Cursor
vim.keymap.set("n", "n", "h")
vim.keymap.set("n", "e", "j")
vim.keymap.set("n", "i", "k")
vim.keymap.set("n", "o", "l")
vim.keymap.set("n", "k", "e")
vim.keymap.set("n", "K", "E")

-- Switch (Insert Mode)
vim.keymap.set("n", "h", "i")
vim.keymap.set("n", "H", "I")
vim.keymap.set("n", "l", "o")
vim.keymap.set("n", "L", "O")

-- Searching
vim.keymap.set("n", "j", "n")
vim.keymap.set("n", "J", "N")
