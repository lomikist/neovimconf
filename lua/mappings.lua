local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jf", "<ESC>")
map("i", "fj", "<ESC>")
map("t", "fj", "<C-\\><C-n>")
map("t", "jf", "<C-\\><C-n>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent
map("n", ";", ":")
map("n", "<S-t>", ':split | terminal<CR>', { noremap = true, silent = true })
map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
-- nvimtree
map("n", "<Space>n", "<cmd> NvimTreeToggle <CR>")
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- Window Navigation
map("n", "<Space>h", "<C-w>h") -- Move to the left window
map("n", "<Space>j", "<C-w>j") -- Move to the window below
map("n", "<Space>k", "<C-w>k") -- Move to the window above
map("n", "<Space>l", "<C-w>l") -- Move to the right window

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<S-w>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>fm", function()
  require("conform").format()
end)

-- Resize Windows with Ctrl + Arrow Keys
map("n", "<C-Up>", ":resize +2<CR>")          -- Increase height with Ctrl + Up
map("n", "<C-Down>", ":resize -2<CR>")        -- Decrease height with Ctrl + Down
map("n", "<C-Left>", ":vertical resize -2<CR>") -- Decrease width with Ctrl + Left
map("n", "<C-Right>", ":vertical resize +2<CR>") -- Increase width with Ctrl + Right
