return {
  -- lsp installation
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      cmd = 'Mason',
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
    opts = {
      ensure_installed = {
        'vimls',
        'lua_ls',
        'clangd',
        'bashls',
        'html',
        'cssls',
        'ts_ls',
        'volar',
        'jsonls',
        'tailwindcss',
        'dockerls',
        'docker_compose_language_service',
      },
    },
  },

  -- lsp
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      { 'folke/neodev.nvim', opts = {} },
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local icons = require('plugins.config.icons').diagnostic_icons

      -- diagnostic
      vim.diagnostic.config({
        virtual_text = false,
        float = { border = 'rounded' },
      })

      -- set signs
      local signs = {
        Error = icons.error,
        Warn = icons.warn,
        Hint = icons.hint,
        Info = icons.info,
      }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', '<space>dt', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist, opts)
          vim.keymap.set('n', '<space>gl', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<space>gk', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<space>gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        end,
      })

      -- border for float win
      require('lspconfig.ui.windows').default_options.border = 'rounded'
      local handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
      }

      -- autocompletion
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- on attch
      local on_attach = function(client, bufnr)
        -- highlight symbol under cursor
        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false,
          })
          vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
          })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.clear_references()
            end,
          })
        end
      end

      local servers = {
        'vimls',
        'clangd',
        'bashls',
        'html',
        'cssls',
        'jsonls',
        'tailwindcss',
        'dockerls',
        'docker_compose_language_service',
      }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      -- lua
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        handlers = handlers,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      -- vue
      local getServerPath = function(package_name, server_path)
        local mason_registry = require('mason-registry')
        return mason_registry.get_package(package_name):get_install_path() .. server_path
      end

      local vue_language_server_path = getServerPath('vue-language-server', '/node_modules/@vue/language-server')
      local typescript_language_server_path =
        getServerPath('typescript-language-server', '/node_modules/typescript/lib')

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
            },
          },
        },
      })
      lspconfig.volar.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          typescript = {
            tsdk = typescript_language_server_path,
          },
        },
      })
    end,
  },
}
