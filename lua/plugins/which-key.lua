return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    win = {
      border = 'rounded',
      no_overlap = true,
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    wk.add {
      -- ============================================
      -- Comandos básicos (os que você mapeou no init)
      -- ============================================
      { '<leader>h', '<cmd>split<cr>', desc = 'Split horizontal' },
      { '<leader>v', '<cmd>vsplit<cr>', desc = 'Split vertical' },
      { '<leader>q', '<cmd>bp<cr>', desc = 'Buffer anterior' },
      { '<leader>w', '<cmd>bn<cr>', desc = 'Próximo buffer' },
      { '<leader>c', '<cmd>bd<cr>', desc = 'Fechar buffer' },
      { '<leader>.', '<cmd>lcd %:p:h<cr>', desc = 'Setar diretório atual' },
      { '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = 'Search & Replace' },
      { '<leader>x', '<cmd>!chmod +x %<cr>', desc = 'Tornar arquivo executável' },
      { '<Esc>', '<cmd>noh<cr>', desc = 'Limpar highlights' },

      -- ============================================
      -- Telescope
      -- ============================================
      { '<leader>f', group = 'Telescope' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Procurar arquivos' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep texto' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Ajuda' },

      -- ============================================
      -- ToggleTerm
      -- ============================================
      { '<leader>t', group = 'Terminal' },
      { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Abrir terminal' },
      { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Terminal flutuante' },
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Terminal horizontal' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = 'Terminal vertical' },

      -- ============================================
      -- Oil.nvim
      -- ============================================
      { '-', '<cmd>Oil<cr>', desc = 'Abrir Oil (explorador)' },

      -- ============================================
      -- Gitsigns
      -- ============================================
      { '<leader>g', group = 'Git' },
      { '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview hunk' },
      { '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', desc = 'Stage hunk' },
      { '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', desc = 'Reset hunk' },
      { '<leader>gn', '<cmd>Gitsigns next_hunk<cr>', desc = 'Próximo hunk' },
      { '<leader>gN', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Hunk anterior' },

      -- ============================================
      -- LSP (via nvim-lspconfig + noice)
      -- ============================================
      { 'K', vim.lsp.buf.hover, desc = 'Hover docs' },
      { 'gd', vim.lsp.buf.definition, desc = 'Ir para definição' },
      { 'gr', vim.lsp.buf.references, desc = 'Referências' },
      { 'gi', vim.lsp.buf.implementation, desc = 'Implementação' },
      { '<leader>rn', vim.lsp.buf.rename, desc = 'Renomear símbolo' },
      { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action' },
    }
  end,
}
