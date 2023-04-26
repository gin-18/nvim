require("nordic").colorscheme({
  underline_option = "none",
  italic = false,
  italic_comments = false,
  minimal_mode = false,
  alternate_backgrounds = false,
})

-- overwrite highlight
local palette = require("nordic.palette")
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = palette.dark_black })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = palette.dark_black })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = palette.gray })
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = palette.gray })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = palette.gray })
vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.dark_white })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = palette.intense_blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = palette.dark_white })
vim.api.nvim_set_hl(0, "FloatermBorder", { bg = palette.dark_black })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = palette.dark_black })
