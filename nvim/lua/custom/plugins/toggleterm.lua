return {
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
}
