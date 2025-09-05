return {
  'stevearc/oil.nvim',
  lazy = false,
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Abrir Oil' },
    { '<leader>o', '<cmd>Oil<cr>', desc = 'Abrir Oil' },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true, -- mostra arquivos ocultos (dotfiles)
      is_hidden_file = function(name, _)
        -- aqui você controla se vai esconder ou não
        -- return name:sub(1, 1) == "."   -- esconder dotfiles
        return false -- nunca esconde nada
      end,
      is_always_hidden = function(name, _)
        -- nunca mostrar esses
        return name == '.git'
      end,
    },
  },
}
