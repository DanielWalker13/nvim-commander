
-- Python Autocompletion / highlighting Items
-- ----------------------------------------------------------------------------
  -- EVAL: Py-LSP vs Jedi
  -- Might be a more native configuration
  -- May be written in lua?

     -- {{{ Jedi }}}

        -- TODO: Review all settings
        -- Forces usage of python3
        -- g:jedi#force_py_version
        --
    -- vim.g.syntastic_python_python_exec = 'python3.10'
    -- vim.cmd [[ g:jedi#environment_path = "venv"]]

        -- TODO: Document Jedi settings
        -- Get this working without special setting
    vim.g['jedi#environment_path'] = '~/.asdf/shims/python'
    -- vim.g['jedi#environment_path'] = '/usr/local/bin/ipython'


        -- All these mappings work only for python code:

        -- vim.g['jedi#environment_path'] = 'venv'               -- Go to definition
    vim.g['jedi#goto_command'] = ',d'               -- Go to definition
    vim.g['jedi#usages_command'] = ',o'              -- Find ocurrences
    vim.g['jedi#goto_assignments_command'] = ',a'   -- Find assignments

    -- TEST: Call function with Git push
    -- This call function might be the solution my git first push issue
    vim.keymap.set('n', ',D', ':tab split<CR>:call jedi#goto()<CR>')

