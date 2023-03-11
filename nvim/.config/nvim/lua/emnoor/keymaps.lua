vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw" })

-- move selections up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selections up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selections down" })

-- join lines without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- move current line the to center after jump to word/line
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {
  desc = "Yank into system clipboard"
})
vim.keymap.set("n", "<leader>Y", [["+Y]], {
  desc = "Yank current line into system clipboard"
})

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = "Go to previous diagnostic message"
})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = "Go to next diagnostic message"
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = "Open floating diagnostic message"
})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = "Open diagnostics list"
})

-- quicklist keymaps
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
