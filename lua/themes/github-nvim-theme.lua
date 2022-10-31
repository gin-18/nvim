vim.cmd[[ highlight TelescopePromptCounter guifg=#adbac7 ]]

require("github-theme").setup({
  theme_style = "dark",
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "NONE",
  variable_style = "NONE",
  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      NvimTreeEndOfBuffer = { fg = c.bg },
      NvimTreeNormal = { bg = c.bg },
      -- TelescopeBorder = { fg = c.fg },
      -- TelescopeSelection = { bg = c.border },
      LspDiagnosticsVirtualTextHint = { bg = 'NONE' },
      DashboardFooter = { gui = 'NONE' }
      -- LspDiagnosticsVirtualTextHint = { fg = '#81A1C1', bg = 'NONE' },
      -- DiagnosticHint = { fg = '#81A1C1' }
      -- this will remove the highlight groups
      -- TSField = {},
    }
  end
})
