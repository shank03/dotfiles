return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      diagnostics = 'nvim_lsp', -- show LSP error/warn count on each tab
      show_buffer_close_icons = false, -- minimal: no per-tab close 'x'
      show_close_icon = false,
      separator_style = 'thin',
      -- offsets = {
      --   {
      --     filetype = 'snacks_layout_box',
      --     text = '',
      --     highlight = 'Directory',
      --     separator = true,
      --   },
      -- },
    },
  },
  keys = {
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer tab' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer tab' },
    { '<S-x>', '<cmd>bdelete<cr>', desc = 'Close buffer tab' },
  },
}
