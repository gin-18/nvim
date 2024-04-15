return {
  -- colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
    opts = {
      flavour = 'mocha',
      no_italic = true,
      highlight_overrides = {
        all = function(colors)
          return {
            NormalFloat = { bg = colors.crust },
          }
        end,
      },
    },
  },

  -- alpha
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        '',
        '',
        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⢧',
        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣵⣶⣾⡶⠶⠿⠿⠶⠿⠾⠶⠶⠼⢮⣙⠢⠤⣀⡀',
        '⣿⣿⣿⣿⣿⣿⣟⣿⣽⣵⣶⠾⠿⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⡲⣦⣀',
        '⣿⣛⣯⣭⣵⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⡇',
        '⡿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁',
        '⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢀⣰⣿⡿⠀⠀⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠖⠉',
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
      }

      dashboard.section.buttons.val = {
        dashboard.button('n', '  New File', '<Cmd>ene <BAR> startinsert<CR>'),
        dashboard.button('p', '  Search Projects', '<Cmd>Telescope projects<CR>'),
        dashboard.button('e', '  NvimTree Explorer', '<Cmd>NvimTreeToggle<CR>'),
        dashboard.button('l', '󰒲  Lazy Manage', '<Cmd>Lazy<CR>'),
        dashboard.button('s', '  Setting', '<Cmd>e $MYVIMRC<CR>'),
        dashboard.button('q', '󰩈  Quit Neovim', '<Cmd>qa<CR>'),
      }

      local stats = require('lazy').stats()
      dashboard.section.footer.val = '󱓟  GIN-Neovim loaded ' .. stats.count .. ' plugins'

      alpha.setup(dashboard.opts)

      vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    end,
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
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
            symbols = {
              error = ' ',
              warn = ' ',
              hint = ' ',
              info = ' ',
            },
          },
        },
      },
    },
  },

  -- indent line
  {
    'lukas-reineke/indent-blankline.nvim',
    event = {
      'BufReadPost',
      'BufNewFile',
    },
    config = function()
      require('ibl').setup {}
    end,
  },
}
