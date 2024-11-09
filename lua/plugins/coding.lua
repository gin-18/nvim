return {
  -- ai
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
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

  -- formatting
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettier' },
          vue = { 'prettier' },
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
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = true,
  },
}
