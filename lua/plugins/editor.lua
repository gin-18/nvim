return {
  -- explorer
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'plugins.config.explorer'
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
      require 'plugins.config.file-finder'
    end,
  },
}
