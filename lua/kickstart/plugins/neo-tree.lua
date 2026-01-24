-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>g', ':Neotree git_status<CR>', desc = 'NeoTree git status', silent = true },
    { '<leader>b', ':Neotree buffers<CR>', desc = 'NeoTree buffers', silent = true },
  },
  opts = {
    window = {
      position = 'float',
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = '✚',
          modified = '',
          deleted = '✖',
          renamed = 'R',
          -- Status type
          untracked = 'A',
          ignored = '-',
          unstaged = 'U',
          staged = 'S',
          conflict = 'C',
        },
        align = 'left',
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '󰜌',
      provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
        if node.type == 'file' or node.type == 'terminal' then
          local success, web_devicons = pcall(require, 'nvim-web-devicons')
          local name = node.type == 'terminal' and 'terminal' or node.name
          if success then
            local devicon, hl = web_devicons.get_icon(name)
            icon.text = devicon or icon.text
            icon.highlight = hl or icon.highlight
          end
        end
      end,
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = '*',
      highlight = 'NeoTreeFileIcon',
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    git_status = {
      window = {
        position = 'float',
      },
    },
    buffers = {
      window = {
        position = 'float',
      },
    },
  },
}
