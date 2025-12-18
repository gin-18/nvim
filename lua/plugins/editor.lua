return {
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      image = {
        doc = {
          inline = false,
        },
      },
      indent = {},
    },
  },

  -- explorer
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<space>ya',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        '<space>yd',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
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
          selection_caret = ' ',
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
