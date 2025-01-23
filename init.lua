require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require('mini.pairs').setup()

vim.keymap.set('n', '<space>ct', function()
  -- Run VimtexCompile
  vim.cmd('VimtexCompile')

  -- Get the current buffer's filename without extension
  local filename = vim.fn.expand('%:r')

  -- Construct and execute the zathura command
  local zathura_cmd = string.format('!zathura %s.pdf &', filename)
  vim.cmd(zathura_cmd)
end)

vim.opt.number = true
