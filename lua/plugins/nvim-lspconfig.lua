return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    {
      'mason-org/mason.nvim',
      config = true,
      cmd = 'Mason',
    },
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },
  config = function()
    -- installing linters/lsp/formatters
    local packages = {
      -- já existentes
      'bash-language-server',
      'dockerfile-language-server',
      'goimports',
      'gopls',
      'json-lsp',
      'lua-language-server',
      'pyright',
      'ruff',
      'shellcheck',
      'shfmt',
      'stylua',
      'yaml-language-server',

      -- node / typescript / extras
      'typescript-language-server',
      'eslint-lsp',
      'prettierd', -- mais rápido que prettier CLI
      'html-lsp',
      'css-lsp',
      'emmet-ls',
    }

    local registry = require 'mason-registry'
    for _, pkg in pairs(packages) do
      if not registry.is_installed(pkg) then
        registry.get_package(pkg):install()
      end
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }
        local builtin = require 'telescope.builtin'

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', builtin.lsp_type_definitions, opts)
        vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', 'gy', builtin.lsp_document_symbols, opts)
        vim.keymap.set('n', 'ws', builtin.lsp_dynamic_workspace_symbols, opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
      end,
    })

    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_uninstalled = '✗',
          package_pending = '⟳',
        },
      },
    }

    vim.lsp.enable {
      -- já existentes
      'bashls',
      'dockerls',
      'gopls',
      'jsonls',
      'lua_ls',
      'pyright',
      'ruff',
      'yamlls',

      -- node/ts extras
      'tsserver',
      'eslint',
      'html',
      'cssls',
      'emmet_ls',
    }

    vim.diagnostic.config {
      severity_sort = true,
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✘',
          [vim.diagnostic.severity.WARN] = '▲',
          [vim.diagnostic.severity.HINT] = '⚑',
          [vim.diagnostic.severity.INFO] = '»',
        },
      },
    }

    -- autoformat com prettier / prettierd para JS/TS/HTML/CSS
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.js', '*.ts', '*.jsx', '*.tsx', '*.json', '*.css', '*.scss', '*.html' },
      callback = function(args)
        vim.lsp.buf.format {
          async = false,
          bufnr = args.buf,
          filter = function(client)
            return client.name == 'prettierd' or client.name == 'null-ls'
          end,
        }
      end,
    })
  end,
}
