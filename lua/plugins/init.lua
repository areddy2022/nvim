return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      local is_mac = vim.fn.has "macunix" == 1
      local is_linux = vim.fn.has "unix" == 1 and not is_mac

      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_mappings_enabled = 0
      vim.g.vimtex_indent_enabled = 0
      if is_mac then
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_general_viewer = "Skim"
      elseif is_linux then
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_general_viewer = "zathura"
      end
      vim.g.vimtex_view_automatic = 1
      vim.g.vimtex_context_pdf_viewer = "zathura"
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Add tools you want automatically installed
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
        "rustfmt",
        "texlab",
        "vimtex",
        "verible",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
      startVisible = true,
      showBlankVirtLine = true,
      hints = {
        Caret = { text = "^", prio = 2 },
        Dollar = { text = "$", prio = 1 },
        MatchingPair = { text = "%", prio = 5 },
        Zero = { text = "0", prio = 1 },
        w = { text = "w", prio = 10 },
        b = { text = "b", prio = 9 },
        e = { text = "e", prio = 8 },
        W = { text = "W", prio = 7 },
        B = { text = "B", prio = 6 },
        E = { text = "E", prio = 5 },
      },
      gutterHints = {
        G = { text = "G", prio = 10 },
        gg = { text = "gg", prio = 9 },
        PrevParagraph = { text = "{", prio = 8 },
        NextParagraph = { text = "}", prio = 8 },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }
      -- Load native LSP config after mason-lspconfig
      require "configs.lspconfig"
    end,
  },
}
