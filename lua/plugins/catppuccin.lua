-- colorscheme
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- garante que o colorscheme seja carregado primeiro
  config = function()
    require('catppuccin').setup {
      flavour = 'frappe', -- latte, frappe, macchiato, mocha
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      auto_integrations = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
