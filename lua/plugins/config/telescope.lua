local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  vim.notify('telescope not found!')
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    layout_stratgy = 'center',
    layout_config = {
      width = 0.8,
      height = 0.7,
    },
    file_ignore_patterns = {
      "node_modules",
      ".git/*",
      "%.zip",
      "%.exe",
      "%.dll"
    },
    mappings = {
      i = {
        ["<C-c>"] = false,
        ["<esc>"] = require('telescope.actions').close,
        ["<C-n>"] = require('telescope.actions').move_selection_next,
        ["<C-p>"] = require('telescope.actions').move_selection_previous,
        ["<C-j>"] = require('telescope.actions').cycle_history_next,
        ["<C-k>"] = require('telescope.actions').cycle_history_prev,
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden" }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    }
  }
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
-- require("telescope").load_extension("yank_history")
