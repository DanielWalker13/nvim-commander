
-- ----------------------------------------------------------------------------
-- Line formatting options
-- ----------------------------------------------------------------------------

    -- letter  meaning when present in 'formatoptions'

    -- t       Auto-wrap text using textwidth
    -- c       Auto-wrap comments using textwidth, inserting the current comment leader automatically.
    -- r       Automatically insert comment leader after hitting <Enter> in Insert mode.
    -- o       Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.

    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2

    vim.opt.formatoptions:append("t")
    vim.opt.formatoptions:remove("j")
    vim.opt.formatoptions:remove("l")
    vim.opt.formatoptions:remove("o")
    vim.opt.formatoptions:remove("q")
    vim.opt.formatoptions:remove("r")


  -- This may need to be modified for other file types
  -- TODO: Find universal soluiton
  -- Autocmd version of this fix
  -- autocmd FileType * set formatoptions-=cro
