
  -- highlight ExtraWhitespace ctermbg = ''

  -- TODO: Make this null if it's set
  -- vim.g.better_whitespace_operator =

  vim.g.better_whitespace_enabled = 1                 -- Enables or disables the plugin.
  vim.g.strip_whitespace_on_save = 1                  -- Automatically strip trailing whitespace when saving a file.
  vim.g.strip_whitespace_confirm = 0                  -- Disable confirmation on save
  vim.g.better_whitespace_show_in_diff = 0            -- Show trailing whitespace in diff mode.
  vim.g.better_whitespace_highlight_extra = 0         -- Highlight extra whitespace.
  vim.g.better_whitespace_highlight_trailing = 0      -- Highlight trailing whitespace.
  vim.g.better_whitespace_auto_newline = 0            -- Automatically add a newline at the end of a file when saving.


  vim.g.better_whitespace_highlight_current_line = 1  -- Disables current line highlighitng
  vim.g.current_line_whitespace_disabled_soft = 1
  -- `g:current_line_whitespace_disabled_hard`         (defaults to 0)

  vim.g.better_whitespace_filetypes_blacklist = {'diff', 'git', 'gitcommit','unite', 'qf', 'help', 'markdown', 'fugitive', 'toggleterm'}
  vim.g.better_whitespace_ignore_patterns = {'*.swp'}-- (default: "tags,.min.,*.swp"): A comma-separated list of file patterns to ignore when auto-stripping whitespace or auto-adding newlines.

  -- vim.g.better_whitespace_ctermcolor = 'blue'
  vim.g.better_whitespace_guicolor = 'white'



  -- NOTE: Whitespace: Large files could cause issues
  -- Solution: Ignore files over a certain size
  -- let g:strip_max_file_size = 1000
