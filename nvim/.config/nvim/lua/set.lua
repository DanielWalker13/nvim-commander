
-- ============================================================================
--  Base Settings
-- ============================================================================


  -- INFO:
  -- check current setting of any option with ':echo &<option-name>'
  -- check where setting wwas set with ':verbose set <option-name>'

  vim.g.mapleader = '\\'     --  Uses '\' as leader key


  -- General Options
  vim.opt.syntax = 'on'                   -- syntax highlight on
  vim.opt.syntax = 'markdown'             --
  vim.opt.encoding = 'utf-8'              -- Enforces standard encoding
  vim.opt.clipboard = 'unnamed'           -- Copy to clipboard
  vim.opt.number = true                   -- Show line numbers
  vim.opt.relativenumber = true           -- Defaults to relative numbers
  vim.opt.spr = true                      -- Forces split to the right
  vim.opt.backspace = 'indent,eol,start'  -- Backspace like normal
  vim.opt.incsearch = true                -- Incremental search
  vim.opt.hlsearch = true                 -- Highlighted search results
  vim.opt.cursorline = true               -- Highlights current line background
  vim.opt.scrolloff = 8                   -- Pading between top/bottom screen for scroll
  vim.opt.timeoutlen = 3000               -- Set longer time to respond after leaader key
  vim.opt.undofile = true                 -- Persistent undos - undo after you re-open the file
  vim.opt.hidden = true                   -- Keeps buffers open in the background
  vim.opt.termguicolors = true            -- set termguicolors to enable highlight groups
  vim.opt.signcolumn= 'auto'              -- Enable Sign Column
  vim.autoindent = true                   -- Carries current indent to next line
  vim.cmd('set noswapfile')               -- Disables swap files

  -- vim.opt.wildmode = 'list:longest'
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.filetype = 'json'
  vim.opt.expandtab = true

-- TODO: Dealing with Folds
  -- Enable for certain file types only?
  -- set foldmethod=syntax

  -- Enables indepenednt configs for deifferent file types
  vim.cmd[[
      filetype plugin on
      filetype indent on
  ]]

  -- Fixes file type recognition for certain files
  vim.cmd [[
      autocmd FileType markdown set conceallevel=0
      autocmd FileType markdown normal zR

      autocmd BufNewFile,BufRead Jenkinsfile setfiletype groovy
      autocmd BufNewFile,BufRead pycodestyle setfiletype toml
      autocmd BufNewFile,BufRead .pylintrc setfiletype toml
  ]]

  -- Sets background for Sign Column and empty space to transparent
  vim.cmd [[
      autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE
      autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
  ]]

  -- Returns to last edit position when opening a file
  vim.cmd [[
      autocmd BufReadPost *
           \ if line("'\"") > 0 && line("'\"") <= line("$") |
           \   exe "normal! g`\"" |
           \ endif
  ]]


  -- TODO: Fix this specific to my config setting
  vim.g.python3_host_prog = '/usr/local/opt/python@3.10/bin/python3'
-- ============================================================================
--  ColorScheme
-- ============================================================================

  -- TODO: Find Best option for colorscheme management
  -- TODO: Identify best colorscheme options

  -- OPTION:
  -- vim.g.gruvbox_termcolors=16
  -- vim.cmd('let g:gruvbox_termcolors=16')


  vim.cmd('set background=dark')
  vim.cmd('colorscheme fisa')
  vim.cmd('set termguicolors')     -- enable true colors support


