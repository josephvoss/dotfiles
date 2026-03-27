return {  
  -- colors and UI
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'base16',
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_a = {'buffers'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
      },
    },
  },
  "edkolev/tmuxline.vim",
  {
    "tinted-theming/tinted-vim",
    config = function()
      vim.g.tinted_background_transparent = 1
    end
  },
  --- highlight todo
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { },
  },
}
