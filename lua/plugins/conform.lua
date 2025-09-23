return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_organize_imports', 'ruff_fix' }, -- ou {'ruff_format', ...}
        go = { 'goimports' },
        bash = { 'shfmt' },

        -- adicionados
        javascript = { 'prettierd', 'eslint_d' }, -- tenta prettier, fallback eslint_d
        typescript = { 'prettierd', 'eslint_d' },
        javascriptreact = { 'prettierd', 'eslint_d' },
        typescriptreact = { 'prettierd', 'eslint_d' },
        json = { 'prettierd' },
        jsonc = { 'prettierd' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        markdown = { 'prettierd' },
        yaml = { 'prettierd' },
      },
      format_on_save = {
        -- opções repassadas para conform.format()
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    }
  end,
}
