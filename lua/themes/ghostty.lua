-- Ghostty terminal color scheme for NvChad base46
-- Matches the Ghostty terminal emulator palette

local M = {}

M.base_30 = {
  white = "#ffffff",
  darker_black = "#101116",
  black = "#16181a", --  nvim bg
  black2 = "#1c1e21",
  one_bg = "#222428",
  one_bg2 = "#2a2c30",
  one_bg3 = "#33353a",
  grey = "#3c4048",
  grey_fg = "#474b52",
  grey_fg2 = "#53575e",
  light_grey = "#5f636a",
  red = "#ff6e5e",
  baby_pink = "#ff8f84",
  pink = "#ff6e5e",
  line = "#2a2c30", -- for lines like vertsplit
  green = "#5eff6c",
  vibrant_green = "#5eff6c",
  nord_blue = "#6fb1ff",
  blue = "#5ea1ff",
  seablue = "#5ea1ff",
  yellow = "#f1ff5e",
  sun = "#f1ff5e",
  purple = "#bd5eff",
  dark_purple = "#a84beb",
  teal = "#5ef1ff",
  orange = "#ffb86c",
  cyan = "#5ef1ff",
  statusline_bg = "#1c1e21",
  lightbg = "#2a2c30",
  pmenu_bg = "#5ea1ff",
  folder_bg = "#5ea1ff",
}

M.base_16 = {
  base00 = "#16181a", -- Default Background
  base01 = "#1c1e21", -- Lighter Background
  base02 = "#3c4048", -- Selection Background
  base03 = "#3c4048", -- Comments, Invisibles
  base04 = "#5f636a", -- Dark Foreground
  base05 = "#ffffff", -- Default Foreground
  base06 = "#ffffff", -- Light Foreground
  base07 = "#ffffff", -- Light Background
  base08 = "#ff6e5e", -- Variables
  base09 = "#ffb86c", -- Integers, Booleans
  base0A = "#f1ff5e", -- Classes
  base0B = "#5eff6c", -- Strings
  base0C = "#5ef1ff", -- Escape characters, Regular expressions
  base0D = "#5ea1ff", -- Functions, Methods
  base0E = "#bd5eff", -- Keywords, Storage, Selector
  base0F = "#ff6e5e", -- Deprecated, Opening/Closing embedded language tags
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_16.base05 },
    ["@punctuation.bracket"] = { fg = M.base_30.purple },
    ["@function.call"] = { fg = M.base_30.blue },
    ["@function.method.call"] = { fg = M.base_30.blue },
    ["@constant"] = { fg = M.base_30.orange },
    ["@variable.parameter"] = { fg = M.base_30.orange },
    ["@string"] = { fg = M.base_30.green },
    ["@keyword"] = { fg = M.base_30.purple },
    ["@type"] = { fg = M.base_30.cyan },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "ghostty")

return M
