return {
  -- explorer
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<space>ee', '<cmd>NvimTreeToggle<cr>', desc = 'Explorer' },
    },
    config = function()
      local icons = require('plugins.config.icons').diagnostic_icons

      require('nvim-tree').setup({
        view = {
          width = 30,
          side = 'left',
        },
        renderer = {
          indent_markers = {
            enable = true,
            icons = {
              corner = '└',
              edge = '│',
              item = '│',
              bottom = '─',
              none = ' ',
            },
          },
          icons = {
            webdev_colors = true,
            git_placement = 'before',
            glyphs = {
              default = '',
              symlink = '',
              git = {
                unstaged = '',
                staged = '',
                unmerged = '',
                renamed = '﯀',
                deleted = '',
                untracked = '󱧈',
                ignored = '',
              },
              folder = {
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            error = icons.error,
            warning = icons.warn,
            hint = icons.hint,
            info = icons.info,
          },
        },
        actions = {
          change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
          },
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = true,
              chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
              exclude = {
                filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                buftype = { 'nofile', 'terminal', 'help' },
              },
            },
          },
        },
      })
    end,
  },

  -- file finder
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    keys = {
      { '<space>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<space>fg', '<cmd>Telescope git_files<cr>', desc = 'Git Files' },
      { '<space>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Oldfiles' },
      { '<space>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<space>fl', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<space>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          layout_stratgy = 'center',
          layout_config = {
            width = 0.8,
            height = 0.7,
          },
          file_ignore_patterns = {
            'node_modules',
            '.git/*',
            '%.zip',
            '%.exe',
            '%.dll',
          },
          mappings = {
            i = {
              ['<C-c>'] = false,
              ['<esc>'] = require('telescope.actions').close,
              ['<C-n>'] = require('telescope.actions').move_selection_next,
              ['<C-p>'] = require('telescope.actions').move_selection_previous,
              ['<C-j>'] = require('telescope.actions').cycle_history_next,
              ['<C-k>'] = require('telescope.actions').cycle_history_prev,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden' },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      })
      require('telescope').load_extension('fzf')
    end,
  },
}
