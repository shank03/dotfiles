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
  'AlexvZyl/nordic.nvim',
  'EdenEast/nightfox.nvim',

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'float',
      open_mapping = [[<leader>j]],
    },
  },
}
