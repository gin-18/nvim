return {
  -- ai
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  -- lsp installation
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        dependencies = {
          'WhoIsSethDaniel/mason-tool-installer.nvim',
          opts = {
            ensure_installed = {
              'stylua',
              'prettier',
              'eslint_d',
            },
          },
        },
        opts = {
          ui = {
            border = 'rounded',
            width = 0.8,
            height = 0.7,
            icons = {
              package_installed = '󰺧',
              package_pending = '',
              package_uninstalled = '󰺭',
            },
          },
        },
      },
    },
    opts = {
      ensure_installed = {
        'clangd',
        'dockerls',
        'bashls',
        'lua_ls',
        'html',
        'cssls',
        'tailwindcss',
        'vtsls',
        'vue_ls',
        'jsonls',
        'marksman',
      },
    },
  },

  -- completion
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = { border = 'rounded' },
        documentation = {
          auto_show = true,
          window = { border = 'rounded' },
        },
      },
      signature = {
        enabled = true,
        window = { border = 'rounded' },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },

  -- git
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<space>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
    config = function()
      require('telescope').load_extension('lazygit')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
      { '<space>hl', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview Hunk' },
      { '<space>hn', '<cmd>Gitsigns next_hunk<cr>', desc = 'Next Hunk' },
      { '<space>hp', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Prev Hunk' },
      { '<space>hr', '<cmd>Gitsigns reset_hunk<cr>', desc = 'Reset Hunk' },
    },
    opts = {
      preview_config = {
        border = 'rounded',
      },
    },
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'vim',
        'lua',
        'c',
        'bash',
        'html',
        'css',
        'javascript',
        'typescript',
        'vue',
        'dockerfile',
        'json',
        'toml',
        'yaml',
        'markdown',
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- linting
  -- {
  --   'mfussenegger/nvim-lint',
  --   event = {
  --     'BufReadPre',
  --     'BufNewFile',
  --   },
  --   opts = {
  --     linters_by_ft = {
  --       javascript = { 'eslint_d' },
  --       typescript = { 'eslint_d' },
  --       vue = { 'eslint_d' },
  --     },
  --   },
  --   config = function()
  --     local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  --
  --     vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  --       group = lint_augroup,
  --       callback = function()
  --         pcall(require, 'lint.try_lint')
  --       end,
  --     })
  --   end,
  -- },

  -- formatting
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          vue = { 'prettier' },
          css = { 'prettier' },
          html = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          toml = { 'prettier' },
        },

        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end,
      })

      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })

      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },

  -- comment
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = 'VeryLazy',
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      toggler = { line = '<space>cc' },
      opleader = { line = '<space>cc' },
    },
  },

  -- utils
  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = true,
  },
  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        window = {
          normal_hl = 'NormalFloat',
          winblend = 0,
          border = 'rounded',
          x_padding = 0,
          y_padding = 0,
        },
      },
    },
  },
}
