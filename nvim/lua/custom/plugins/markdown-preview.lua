return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
    ft = { 'markdown' },
    -- app/install.sh downloads the prebuilt server binary over curl; no yarn/node build.
    -- called as a shell command (not mkdp#util#install) to avoid E117 when the plugin's
    -- autoload isn't sourced yet at build time.
    build = 'cd app && ./install.sh',
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', ft = 'markdown', desc = 'Markdown preview toggle' },
    },
  },
}
