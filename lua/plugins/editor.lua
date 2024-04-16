return {
  -- explorer
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        auto_reload_on_write = true,
        disable_netrw = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        open_on_tab = false,
        sort_by = 'name',
        view = {
          width = 30,
          side = 'left',
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = 'yes',
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
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
          update_root = true,
          ignore_list = {},
        },
        system_open = {
          cmd = '',
          args = {},
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            error = '',
            warning = '',
            hint = '',
            info = '',
          },
        },
        filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        actions = {
          use_system_clipboard = true,
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
        trash = {
          cmd = 'trash',
          require_confirm = true,
        },
        log = {
          enable = false,
          truncate = false,
          types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
          },
        },
      }
    end,
  },

  -- file finder
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    event = 'VeryLazy',
  },
  {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
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
      }
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'projects'
    end,
  },
}
