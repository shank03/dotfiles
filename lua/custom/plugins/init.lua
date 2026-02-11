-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

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

  {
    'f-person/auto-dark-mode.nvim',
    config = true,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd.colorscheme 'kanagawa'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd.colorscheme 'dawnfox'
      end,
    },
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    opts = {
      size = vim.o.columns * 0.4,
      direction = 'vertical',
      open_mapping = [[<D-j>]],
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
