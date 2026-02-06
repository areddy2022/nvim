local opts = require "nvchad.configs.treesitter"

opts.highlight = opts.highlight or {}
opts.highlight.enable = true

opts.ensure_installed = {
  "vim",
  "lua",
  "vimdoc",
  "luadoc",
  "printf",
  "html",
  "css",
  "cpp",
  "c",
  "python",
  "rust",
  "vhdl",
  "verilog",
}

return opts
