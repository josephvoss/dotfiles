return {
  -- essential
  'neovim/nvim-lspconfig',
  "tpope/vim-sensible", --- defaults
  "tpope/vim-vinegar", --- File browser
  --- preview window of keypresses to help remember commands
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    dependencies = {
      "nvim-mini/mini.icons"
    },
  },
  --- completes
  {
    'saghen/blink.cmp',
    version = '1.*',
    -- build = 'nix run .#build-plugin',
    build = 'cargo build --release',
    opts = {
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
    },
  },
  --- For syntax and syntastic linting toggles
  {
    "josephvoss/vim-unimpaired",
    config = function()
      vim.unimpaired_colorcolumn=80
    end
  },

  -- Git
  --- Git changes
  {
    "tpope/vim-fugitive",
    keys = {
      { '<leader>gg', '<cmd>G grep <cword><cr>', desc = 'Git grep word under cursor' },
      { '<leader>gb', '<cmd>GBrowse!<cr>', desc = 'Git browse to clipboard', mode = 'n' },
      { '<leader>gb', "<cmd>'<,'>GBrowse!<cr>", desc = 'Git browse to clipboard', mode = 'v' },
    },
    cmd = { "G", "Git" },
  },
  {
    "mhinz/vim-signify",
    config = function()
      vim.g.signify_vcs_list = {"git"}
    end
  },
  --- Gbrowse integrations
  "tpope/vim-rhubarb",
  {
    "shumphrey/fugitive-gitlab.vim",
    config = function()
      vim.g.fugitive_gitlab_domains = {'https://gitlab.cfdata.org'}
    end
  },

  -- extra fts
  'google/vim-jsonnet',
  'jamessan/vim-gnupg',
  'kaarmu/typst.vim',
  'saltstack/salt-vim',
  'sheerun/vim-polyglot',
}
