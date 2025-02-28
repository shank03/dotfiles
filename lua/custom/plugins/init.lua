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

  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd.colorscheme 'catppuccin-mocha'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd.colorscheme 'dayfox'
      end,
    },
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      -- direction = 'float',
      open_mapping = [[<D-j>]],
    },
  },
}
