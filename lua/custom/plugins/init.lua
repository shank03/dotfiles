-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Inside tmux: receives encoded sequence
vim.keymap.set({ 'n', 't' }, '<M-j>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })

return {
  'ThePrimeagen/vim-be-good',
  'williamboman/mason.nvim',
  'rebelot/kanagawa.nvim',
  'sho-87/kanagawa-paper.nvim',
  'mg979/vim-visual-multi',
  'EdenEast/nightfox.nvim',
  'catppuccin/nvim',
  'AlexvZyl/nordic.nvim',
  'felipeagc/fleet-theme-nvim',

  -- {
  --   'deparr/tairiki.nvim',
  --   priority = 1000,
  -- },

  -- {
  --   'f-person/auto-dark-mode.nvim',
  --   config = true,
  --   opts = {
  --     update_interval = 1000,
  --     set_dark_mode = function()
  --       vim.api.nvim_set_option_value('background', 'dark', {})
  --       vim.cmd.colorscheme 'kanagawa'
  --     end,
  --     set_light_mode = function()
  --       vim.api.nvim_set_option_value('background', 'light', {})
  --       vim.cmd.colorscheme 'dawnfox'
  --     end,
  --   },
  -- },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    opts = {
      size = vim.o.columns * 0.4,
      direction = 'float',
      open_mapping = [[<D-j>]],
    },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      -- GIT
      {
        '<leader>gb',
        function()
          Snacks.picker.git_branches()
        end,
        desc = 'Git Branches',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log()
        end,
        desc = 'Git Log',
      },
      {
        '<leader>gL',
        function()
          Snacks.picker.git_log_line()
        end,
        desc = 'Git Log Line',
      },
      {
        '<leader>gs',
        function()
          Snacks.picker.git_status()
        end,
        desc = 'Git Status',
      },
      {
        '<leader>gS',
        function()
          Snacks.picker.git_stash()
        end,
        desc = 'Git Stash',
      },
      {
        '<leader>gd',
        function()
          Snacks.picker.git_diff()
        end,
        desc = 'Git Diff (Hunks)',
      },
      {
        '<leader>gf',
        function()
          Snacks.picker.git_log_file()
        end,
        desc = 'Git Log File',
      },
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git Browse',
        mode = { 'n', 'v' },
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      -- LSP
      {
        'gd',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = 'Goto Definition',
      },
      {
        'gD',
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = 'Goto Declaration',
      },
      {
        'gr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'References',
      },
      {
        'gi',
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = 'Goto Implementation',
      },
      {
        'gt',
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = 'Goto [T]ype Definition',
      },
      {
        'gai',
        function()
          Snacks.picker.lsp_incoming_calls()
        end,
        desc = 'C[a]lls Incoming',
      },
      {
        'gao',
        function()
          Snacks.picker.lsp_outgoing_calls()
        end,
        desc = 'C[a]lls Outgoing',
      },
      {
        '<leader>ds',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
      },
      {
        '<leader>ws',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
      },
      -- OTHERS
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = 'Toggle Zen Mode',
      },
      {
        '<leader>Z',
        function()
          Snacks.zen.zoom()
        end,
        desc = 'Toggle Zoom',
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>S',
        function()
          Snacks.scratch.select()
        end,
        desc = 'Select Scratch Buffer',
      },
    },
  },

  -- {
  --   'cordx56/rustowl',
  --   version = '*',
  --   build = 'cargo install --locked rustowl',
  --   lazy = false,
  --   opts = {},
  -- },
}
