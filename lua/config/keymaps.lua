-- disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- switch buffers
vim.keymap.set("n", "<Leader>j", ":bnext<Enter>", { desc = "next buffer" })
vim.keymap.set("n", "<Leader>k", ":bprevious<Enter>", { desc = "previous buffer" })

-- switch windows
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- resize windows
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")

-- switch tabs
vim.keymap.set("n", "<Tab>", ":tabnext<Enter>")
vim.keymap.set("n", "<S-Tab>", ":tabprev<Enter>")

-- move lines
vim.keymap.set("n", "<A-k>", ":m .-2<Enter>==")
vim.keymap.set("n", "<A-j>", ":m .+1<Enter>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<Enter>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<Enter>gv=gv")

-- insert lines
vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

-- void register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "[p]aste" })
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d', { desc = "[d]elete" })

-- diagnostics
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "diagnostic [q]uickfix" })

-- replace all
vim.keymap.set("n", "<Leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace all" })

-- disable search highlights
vim.keymap.set("n", "<Esc>", ":nohlsearch<Enter>", { silent = true })

-- `npm run format`
vim.keymap.set("n", "<Leader>nf", ":!npm run format<Enter>", { silent = true, desc = "[n]pm run [f]ormat" })

-- `chmod +x`
vim.keymap.set("n", "<Leader>x", ":!chmod +x %<Enter>", { silent = true, desc = "chmod +[x]" })

vim.keymap.set("n", "+", "<C-a>") -- increment
vim.keymap.set("n", "-", "<C-x>") -- decrement
vim.keymap.set("n", "J", "mzJ`z") -- join without moving cursor

-- goto opening pair
vim.keymap.set({ "n", "x" }, ")", function()
	vim.fn.search("['\"[({<]", "W")
end)

-- goto closing pair
vim.keymap.set({ "n", "x" }, "(", function()
	vim.fn.search("[]'\")}>]", "bW")
end)
