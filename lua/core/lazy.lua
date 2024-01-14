local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://ghproxy.com/https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- dependencies
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- ui
  {
    "andersevenrud/nordic.nvim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre", "BufNewFile",
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },

  -- complement
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  {
    "tzachar/cmp-tabnine",
     build = "./install.sh",
  },

  -- snippet
  {
    "L3MON4D3/LuaSnip",
    version = "<CurrentMajor>.*",
    build = "make install_jsregexp",
  },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    version = "*",
  },

  -- file finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
  },

  -- git
  {
    "lewis6991/gitsigns.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },

  -- utils
  {
    "Exafunction/codeium.vim",
    event = "BufEnter"
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
    keys = "<SPACE>cc",
  },
  {
    "folke/todo-comments.nvim",
    cmd = {
      "TodoTrouble",
      "TodoTelescope",
    },
    event = {
      "BufReadPost",
      "BufNewFile",
    },
  },
  -- { "akinsho/toggleterm.nvim",
  --   version = "*",
  --   config = true,
  -- },
  -- { "simrat39/symbols-outline.nvim" },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
  },
  {
    "ferrine/md-img-paste.vim",
    ft = "markdown",
  },

  -- front end
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
  },
}

local opts = {
  ui = {
    border = "rounded",
  },
  -- git = {
  --   url_format = "https://ghproxy.com/https://github.com/%s",
  -- },
}

require("lazy").setup(plugins, opts)
