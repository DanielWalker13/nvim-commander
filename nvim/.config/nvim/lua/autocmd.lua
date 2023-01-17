-- ----------------------------------------------------------------------------
-- Autocmd
-- ----------------------------------------------------------------------------

  -- Adds markdown synatx highlighting for .md files
  local md_group = vim.api.nvim_create_augroup('markdown', {clear = true})

  vim.api.nvim_create_autocmd('BufNewFile,BufRead', {
    pattern = '*.md,*.markdown',
    group = md_group,
    command = 'setlocal filetype=ghmarkdown'
  })


  -- RESEARCH: Learn to convert Autocmd from vimscript to lua
  -- Conversion Example

  -- augroup highlight_cmds
  --   autocmd!
  --   autocmd ColorScheme rubber highlight String guifg=#FFEB95
  -- augroup END
  -- This block should be executed before calling the colorscheme command.

  -- This would be the equivalent in lua.

  -- local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})

  -- vim.api.nvim_create_autocmd('ColorScheme', {
  --   pattern = 'rubber',
  --   group = augroup,
  --   command = 'highlight String guifg=#FFEB95'
  -- })
