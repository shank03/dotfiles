-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '<leader>tc', function()
  require('telescope.builtin').colorscheme {
    enable_preview = true,
    layout_config = { preview_cutoff = 512 },
  }
end, { desc = 'Telescope colorschemes' })

vim.o.winborder = 'rounded'
vim.go.pumborder = 'rounded'
vim.opt.cmdheight = 0

return {
  'ThePrimeagen/vim-be-good',
  'williamboman/mason.nvim',
  'mg979/vim-visual-multi',

  -- themes
  'rebelot/kanagawa.nvim',
  'sho-87/kanagawa-paper.nvim',
  'EdenEast/nightfox.nvim',
  'catppuccin/nvim',
  'AlexvZyl/nordic.nvim',
  'felipeagc/fleet-theme-nvim',

  {
    'shank03/vesper.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vesper').setup { style = 'auto' }
      vim.cmd 'colorscheme vesper'
    end,
  },

  {
    'f-person/auto-dark-mode.nvim',
    config = true,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
      end,
    },
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = vim.o.columns * 0.4,
        direction = 'float',
        open_mapping = [[<M-j>]],
        float_opts = {
          border = 'rounded',
        },
        highlights = {
          FloatBorder = { link = 'LineNr' },
        },
      }

      -- Inside tmux: receives encoded sequence
      vim.keymap.set({ 'n', 't' }, '<M-j>', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
      vim.keymap.set({ 'n', 't' }, '<M-t>', '<cmd>TermSelect<cr>', { desc = 'Select Terminal' })
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      cmdline = {
        enabled = true,
        view = 'cmdline_popup',
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = {
        enabled = true,
        replace_netrw = true,
        trash = true,
      },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            layout = {
              preset = 'sidebar',
              layout = {
                width = 28,
                min_width = 28,
              },
            },
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      terminal = {
        win = {
          style = 'terminal',
          position = 'float',
          width = 0.85,
          height = 0.85,
          backdrop = 90,
          border = 'rounded',
          bo = {
            filetype = 'snacks_terminal',
          },
          -- wo = {
          --   winhighlight = 'Normal:Normal,NormalNC:Normal',
          -- },
        },
      },
    },
    keys = {
      -- EXPLORER (replaces neo-tree)
      {
        '\\',
        function()
          Snacks.explorer()
        end,
        desc = 'Snacks Explorer',
        silent = true,
      },
      {
        '<leader>b',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      -- TERMINAL (replaces toggleterm)
      -- {
      --   '<D-j>',
      --   function()
      --     Snacks.terminal.toggle()
      --   end,
      --   desc = 'Toggle Terminal',
      --   mode = { 'n', 't', 'i' },
      -- },
      -- {
      --   '<M-j>',
      --   function()
      --     Snacks.terminal.toggle()
      --   end,
      --   desc = 'Toggle Terminal (tmux)',
      --   mode = { 'n', 't' },
      -- },
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
      -- {
      --   '<leader>tc',
      --   function()
      --     Snacks.picker.colorschemes { preview = 'file' }
      --   end,
      --   desc = 'Colorschemes',
      -- },
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
