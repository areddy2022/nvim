require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cc", ":VimtexCompile<CR>")
map("n", "<leader>cq", ":VimtexStop<CR>")
map("n", "<leader>cv", ":!zathura %:r.pdf &<CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
