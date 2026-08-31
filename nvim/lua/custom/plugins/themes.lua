vim.keymap.set('n', '<leader>tc', function()
  require('telescope.builtin').colorscheme {
    enable_preview = true,
    layout_config = { preview_cutoff = 512 },
  }
end, { desc = 'Telescope colorschemes' })

return {
  'rebelot/kanagawa.nvim',
  'sho-87/kanagawa-paper.nvim',
  'EdenEast/nightfox.nvim',
  'catppuccin/nvim',
  'AlexvZyl/nordic.nvim',
  'felipeagc/fleet-theme-nvim',

  {
    'shvdx/vesper.nvim',
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
}
