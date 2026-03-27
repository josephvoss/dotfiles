return {
  --- telescope
  {
    'nvim-telescope/telescope.nvim',
     dependencies = {
       'nvim-lua/plenary.nvim',
     },
     opts = {
       extensions = 'theprimeagen/git-worktree.nvim',
     },
     keys = (function()
       local builtin = require('telescope.builtin')
       return {
         { '<leader>fr', builtin.live_grep, desc = 'Telescope live grep' },
         { '<leader>fb', builtin.buffers, desc = 'Telescope buffers' },
         { '<leader>fh', builtin.help_tags, desc = 'Telescope help tags' },
         { '<leader>fgb', builtin.git_branches, desc = 'Telescope git branches' },
         { '<leader>fgs', builtin.git_status, desc = 'Telescope git status' },
         {
           '<leader>ff',
           function()
             local is_git = vim.loop.fs_stat(vim.loop.cwd() .. "/.git")
             if is_git then
               builtin.git_files()
             else
               builtin.find_files()
             end
           end,
           desc = 'Find files (git-aware)'
         },
       }
     end)(),
  },
}
