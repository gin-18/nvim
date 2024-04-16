return {
  -- ai
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  -- git
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
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
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'bash',
        'json',
        'python',
        'html',
        'css',
        'javascript',
        'vue',
      },
    },
  },

  -- formatting
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { { 'prettierd', 'prettier' } },
        vue = { { 'prettierd', 'prettier' } },
      },
      format_on_save = {
        timeout_ms = 600,
        lsp_fallback = true,
      },
    },
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
    keys = '<SPACE>cc',
    opts = {
      toggler = { line = '<SPACE>cc' },
      opleader = { line = '<SPACE>cc' },
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
