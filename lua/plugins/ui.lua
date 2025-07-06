return {
  -- colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('catppuccin')
    end,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        no_italic = true,
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = colors.base },
            Pmenu = { bg = colors.base },
          }
        end,
      })
    end,
  },

  -- alpha
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      local icons = require('config.icons').alpha_icons

      dashboard.section.header.val = {
        '',
        '',
        '',
        '',
        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⢧',
        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⠿⠿⢮⣙⠢⠤⣀⡀',
        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⡲⣦⣀',
        '⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⡇',
        '⡿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁',
        '⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⣰⣿⡿⠀⠀⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠖⠉',
        '⣰⣀⣼⣿⣇⢰⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⣀⣠⣾⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠖⠉',
        '⣿⡿⢻⠟⠿⠈⠀⠀⠀⠀⣠⣴⣦⣤⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⢸⡇',
        '⠉⠁⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠄⠀⠀⠀⠀⠀⢸⡇',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠌⠁⠀⠀⠀⠀⠀⠀⠀⢸⡇',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢿⣦⣽⣿⣿⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠻⣿⣿⣿⣿⣿⣷⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⢠⡞',
        '⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⢙⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⢀⣤⠶⠖⠉',
        '⠀⢀⣰⣦⣭⣿⣷⣤⣔⣣⠀⠱⣗⢬⠙⠻⢿⣿⣿⣿⣿⣿⡟⠁⢰⠏⠉',
        '⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠈⠡⠐⣠⡶⠦⣭⣙⣛⣉⣠⡴⠏',
        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⡏⠀⠀⠀⠈⠉⠉⠉',
        '',
        '',
        '',
        '',
      }

      dashboard.section.buttons.val = {
        dashboard.button('n', icons.new_file .. ' New File', '<Cmd>ene <BAR> startinsert<CR>'),
        dashboard.button('e', icons.explorer .. ' NvimTree Explorer', '<Cmd>NvimTreeToggle<CR>'),
        dashboard.button('l', icons.plugin_manager .. ' Lazy Manage', '<Cmd>Lazy<CR>'),
        dashboard.button('s', icons.setting .. ' Setting', '<Cmd>e $MYVIMRC<CR>'),
        dashboard.button('q', icons.quit .. ' Quit Neovim', '<Cmd>qa<CR>'),
      }

      local stats = require('lazy').stats()
      dashboard.section.footer.val = icons.loaded
        .. ' GIN-Neovim loaded '
        .. stats.loaded
        .. ' / '
        .. stats.count
        .. ' plugins'

      alpha.setup(dashboard.opts)

      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      local icons = require('config.icons').diagnostic_icons
      return {
        options = {
          component_separators = { right = '|' },
          section_separators = '',
        },
        sections = {
          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              symbols = icons,
            },
          },
          lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
          },
        },
      }
    end,
  },

  -- indent line
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '▏',
      },
    },
  },
}
