return {
  -- the reason I'm doing this mess
  -- alt opencode plugin with better nvim integration (buffers!)
  {
      "sudo-tee/opencode.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        {
          "MeanderingProgrammer/render-markdown.nvim",
          opts = {
            anti_conceal = { enabled = false },
            file_types = { 'markdown', 'opencode_output' },
          },
          ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
        },
        -- Optional, for file mentions and commands completion, pick only one
        'saghen/blink.cmp',
        -- 'hrsh7th/nvim-cmp',
    
        -- Optional, for file mentions picker, pick only one
        -- 'folke/snacks.nvim',
        'nvim-telescope/telescope.nvim',
        -- 'ibhagwan/fzf-lua',
        -- 'nvim_mini/mini.nvim',
    },
    opts = {
      preferred_picker = 'telescope', -- 'telescope', 'fzf', 'mini.pick', 'snacks', if nil, it will use the best available picker. Note mini.pick does not support multiple selections
      preferred_completion = 'blink', -- 'blink', 'nvim-cmp','vim_complete' if nil, it will use the best available completion
      default_global_keymaps = true, -- If false, disables all default global keymaps
      default_mode = 'plan', -- 'build' or 'plan' or any custom configured. @see [OpenCode Agents](https://opencode.ai/docs/modes/)
      keymap_prefix = '<leader>o', -- Default keymap prefix for global keymaps change to your preferred prefix and it will be applied to all keymaps starting with <leader>o
      keymap = {
        editor = {
          ['<leader>og'] = { 'toggle', desc = 'Toggle opencode window' },
          ['<leader>oi'] = { 'open_input', desc = 'Open input window' },
          ['<leader>oI'] = { 'open_input_new_session', desc = 'Open input in new session' },
          ['<leader>oo'] = { 'open_output', desc = 'Open output window' },
          ['<leader>ot'] = { 'toggle_focus', desc = 'Toggle focus' },
          ['<leader>oq'] = { 'close', desc = 'Close windows' },
          ['<leader>os'] = { 'select_session', desc = 'Select session' },
          ['<leader>oa'] = { 'select_agent', desc = 'Select agent' },
          ['<leader>op'] = { 'configure_provider', desc = 'Configure provider' },
          ['<leader>od'] = { 'diff_open', desc = 'Open diff view' },
          ['<leader>o]'] = { 'diff_next', desc = 'Next diff' },
          ['<leader>o['] = { 'diff_prev', desc = 'Previous diff' },
          ['<leader>oc'] = { 'diff_close', desc = 'Close diff view' },
          ['<leader>ora'] = { 'diff_revert_all_last_prompt', desc = 'Revert all (last prompt)' },
          ['<leader>ort'] = { 'diff_revert_this_last_prompt', desc = 'Revert this (last prompt)' },
          ['<leader>orA'] = { 'diff_revert_all', desc = 'Revert all (session)' },
          ['<leader>orT'] = { 'diff_revert_this', desc = 'Revert this (session)' },
          ['<leader>orr'] = { 'diff_restore_snapshot_file', desc = 'Restore file snapshot' },
          ['<leader>orR'] = { 'diff_restore_snapshot_all', desc = 'Restore all snapshots' },
          ['<leader>ox'] = { 'swap_position', desc = 'Swap pane position' },
          ['<leader>opa'] = { 'permission_accept', desc = 'Accept permission' },
          ['<leader>opA'] = { 'permission_accept_all', desc = 'Accept all permissions' },
          ['<leader>opd'] = { 'permission_deny', desc = 'Deny permission' },
        },
        input_window = {
          ['<cr>'] = { 'submit_input_prompt', mode = { 'n', 'i' }, desc = 'Submit prompt' },
          ['<esc>'] = { 'close', desc = 'Close windows' },
          ['<C-c>'] = { 'cancel', desc = 'Stop opencode' },
          ['~'] = { 'mention_file', mode = 'i', desc = 'Mention file' },
          ['@'] = { 'mention', mode = 'i', desc = 'Insert mention' },
          ['/'] = { 'slash_commands', mode = 'i', desc = 'Slash commands' },
          ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' }, desc = 'Toggle pane' },
          ['<up>'] = { 'prev_prompt_history', mode = { 'n', 'i' }, desc = 'Previous prompt' },
          ['<down>'] = { 'next_prompt_history', mode = { 'n', 'i' }, desc = 'Next prompt' },
          ['<M-m>'] = { 'switch_mode', desc = 'Switch mode' },
        },
        output_window = {
          ['<esc>'] = { 'close', desc = 'Close windows' },
          ['<C-c>'] = { 'cancel', desc = 'Stop opencode' },
          [']]'] = { 'next_message', desc = 'Next message' },
          ['[['] = { 'prev_message', desc = 'Previous message' },
          ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' }, desc = 'Toggle pane' },
          ['i'] = { 'focus_input', 'n', desc = 'Focus input' },
          ['<leader>oS'] = { 'select_child_session', desc = 'Select child session' },
          ['<leader>oD'] = { 'debug_message', desc = 'Debug message' },
          ['<leader>oO'] = { 'debug_output', desc = 'Debug output' },
          ['<leader>ods'] = { 'debug_session', desc = 'Debug session' },
        },
        permission = {
          accept = 'a', -- Accept permission request once (only available when there is a pending permission request)
          accept_all = 'A', -- Accept all (for current tool) permission request once (only available when there is a pending permission request)
          deny = 'd', -- Deny permission request once (only available when there is a pending permission request)
        },
        session_picker = {
          delete_session = { '<C-d>' }, -- Delete selected session in the session picker
        },
      },
      ui = {
        position = 'right', -- 'right' (default) or 'left'. Position of the UI split
        input_position = 'bottom', -- 'bottom' (default) or 'top'. Position of the input window
        window_width = 0.25, -- Width as percentage of editor width
        input_height = 0.15, -- Input height as percentage of window height
        display_model = true, -- Display model name on top winbar
        display_context_size = true, -- Display context size in the footer
        display_cost = true, -- Display cost in the footer
        window_highlight = 'Normal:OpencodeBackground,FloatBorder:OpencodeBorder', -- Highlight group for the opencode window
        icons = {
          preset = 'nerdfonts', -- 'nerdfonts' | 'text'. Choose UI icon style (default: 'nerdfonts')
          overrides = {}, -- Optional per-key overrides, see section below
        },
        output = {
          tools = {
            show_output = true, -- Show tools output [diffs, cmd output, etc.] (default: true)
          },
          rendering = {
            markdown_debounce_ms = 250, -- Debounce time for markdown rendering on new data (default: 250ms)
            on_data_rendered = nil, -- Called when new data is rendered; set to false to disable default RenderMarkdown/Markview behavior
          },
        },
        input = {
          text = {
            wrap = false, -- Wraps text inside input window
          },
        },
        completion = {
          file_sources = {
            enabled = true,
            preferred_cli_tool = 'server', -- 'fd','fdfind','rg','git','server' if nil, it will use the best available tool, 'server' uses opencode cli to get file list (works cross platform) and supports folders
            ignore_patterns = {
              '^%.git/',
              '^%.svn/',
              '^%.hg/',
              'node_modules/',
              '%.pyc$',
              '%.o$',
              '%.obj$',
              '%.exe$',
              '%.dll$',
              '%.so$',
              '%.dylib$',
              '%.class$',
              '%.jar$',
              '%.war$',
              '%.ear$',
              'target/',
              'build/',
              'dist/',
              'out/',
              'deps/',
              '%.tmp$',
              '%.temp$',
              '%.log$',
              '%.cache$',
            },
            max_files = 10,
            max_display_length = 50, -- Maximum length for file path display in completion, truncates from left with "..."
          },
        },
      },
      context = {
        enabled = true, -- Enable automatic context capturing
        cursor_data = {
          enabled = false, -- Include cursor position and line content in the context
        },
        diagnostics = {
          info = false, -- Include diagnostics info in the context (default to false
          warn = true, -- Include diagnostics warnings in the context
          error = true, -- Include diagnostics errors in the context
        },
        current_file = {
          enabled = true, -- Include current file path and content in the context
        },
        selection = {
          enabled = true, -- Include selected text in the context
        },
      },
      debug = {
        enabled = false, -- Enable debug messages in the output window
      },
      prompt_guard = nil, -- Optional function that returns boolean to control when prompts can be sent (see Prompt Guard section)
    },
    config = function(_, opts)
      require("opencode").setup(opts)
    end,
  },
}
