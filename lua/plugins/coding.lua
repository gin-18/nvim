return {
  -- lsp installation
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = {
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
  {
    'williamboman/mason-lspconfig.nvim',
    event = 'VeryLazy',
    opts = {
      ensure_installed = {
        'clangd',
        'vimls',
        'lua_ls',
        'html',
        'cssls',
        'tsserver',
        'volar',
        'jsonls',
        'tailwindcss',
      },
      automatic_installation = false,
    },
  },

  -- lsp
  {
    'neovim/nvim-lspconfig',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = function()
      require 'plugins.config.lsp'
    end,
  },

  -- snippet
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },
  {
    'L3MON4D3/LuaSnip',
    version = '<CurrentMajor>.*',
    build = 'make install_jsregexp',
    event = 'VeryLazy',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_vscode').load {
        paths = { './my-snippets' },
      }
    end,
  },

  -- ai
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  -- completion
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'onsails/lspkind.nvim' },
  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'plugins.config.completion'
    end,
  },

  -- git
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
  },
  {
    'lewis6991/gitsigns.nvim',
    event = {
      'BufReadPre',
      'BufNewFile',
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
    event = {
      'BufReadPost',
      'BufNewFile',
    },
    opts = {
      ensure_installed = {
        'c',
        'lua',
        'python',
        'html',
        'css',
        'javascript',
        'typescript',
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
  -- TODO: visual toggle comment
  {
    'folke/todo-comments.nvim',
    cmd = {
      'TodoTrouble',
      'TodoTelescope',
    },
    event = {
      'BufReadPost',
      'BufNewFile',
    },
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    keys = '<SPACE>cc',
    opts = {
      toggler = {
        line = '<SPACE>cc',
      },
      opleader = {
        line = '<SPACE>cc',
      },
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
