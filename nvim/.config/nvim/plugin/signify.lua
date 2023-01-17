-- ----------------------------------------------------------------------------
-- Signify Settings
-- ----------------------------------------------------------------------------

-- INFO: Plugin which ads git changes to the sign column

  -- Scope
  vim.g.signify_vcs_list = { 'git', 'hg' }

    -- Better Color Scheme
    vim.cmd[[
        highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
        highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
        highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
        highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
        highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
        highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
    ]]

