-- ----------------------------------------------------------------------------
-- Autocmd
-- ----------------------------------------------------------------------------

  -- Adds markdown synatx highlighting for .md files
  local md_group = vim.api.nvim_create_augroup('markdown', {clear = true})

  vim.api.nvim_create_autocmd('BufNewFile, BufRead', {
    pattern = '*.md,*.markdown',
    group = md_group,
    command = 'setlocal filetype=ghmarkdown'
  })

local tfvars_group = vim.api.nvim_create_augroup('tfvars', {clear = true})

vim.api.nvim_create_autocmd('BufRead, BufNewFile', {
  pattern = '*.tfvars',
  group = tfvars_group,
  command = 'setlocal filetype=hcl'
})



