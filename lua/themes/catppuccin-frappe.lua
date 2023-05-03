require("catppuccin").setup({
  flavour = "frappe",
  no_italic = true,
  highlight_overrides = {
    all = function (colors)
      return {
        NormalFloat = { bg = colors.base },
      }
    end
  }
})

vim.cmd.colorscheme "catppuccin"
