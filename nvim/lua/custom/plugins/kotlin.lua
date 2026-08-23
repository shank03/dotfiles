local function maven_reactor_root(fname)
  local dir = vim.fs.dirname(fname)
  local root = nil
  while dir and dir ~= '' do
    if vim.uv.fs_stat(dir .. '/pom.xml') then
      root = dir -- Remember the highest pom.xml seen while climbing.
    elseif root then
      break -- Left the contiguous reactor; the last pom.xml was the root.
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break -- Reached the filesystem root.
    end
    dir = parent
  end
  return root
end

vim.lsp.config('kotlin_lsp', {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(maven_reactor_root(fname) or vim.fs.dirname(fname))
  end,
})

return {}
