-- Neovim 0.11+ native LSP configuration using vim.lsp.config

-- Custom on_attach function
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Keymaps
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- Build capabilities with nvim-cmp support if available
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
end

-- Common config applied to all servers
local default_config = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Servers with default config
local servers = { "html", "cssls", "texlab", "vhdl_ls", "verible" }

for _, server in ipairs(servers) do
  vim.lsp.config[server] = default_config
end

-- Pyright
vim.lsp.config.pyright = vim.tbl_deep_extend("force", default_config, {
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

-- Pylsp
vim.lsp.config.pylsp = vim.tbl_deep_extend("force", default_config, {
  filetypes = { "python" },
})

-- Clangd
vim.lsp.config.clangd = vim.tbl_deep_extend("force", default_config, {
  filetypes = { "cpp", "c" },
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

-- Rust Analyzer
vim.lsp.config.rust_analyzer = vim.tbl_deep_extend("force", default_config, {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

-- Enable all configured servers
vim.lsp.enable({
  "html",
  "cssls",
  "texlab",
  "vhdl_ls",
  "verible",
  "pyright",
  "pylsp",
  "clangd",
  "rust_analyzer",
})
