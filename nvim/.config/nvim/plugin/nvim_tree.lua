-- ----------------------------------------------------------------------------
-- NERDTree Config
-- ----------------------------------------------------------------------------

-- disable netrw(built-in file explorer) at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NOTE: Depends on: Setttings in lua/set.lua
-- vim.opt.termguicolors = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- TODO: Create remap options

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "t", action = "newtab" },
        { key = "s", action = "split" },
        { key = "v", action = "vsplit" },
        { key = "<C-s>", action = "system_open" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

  -- TODO: Nvim Tree: Stop buffer being swappable

    -- NerdTree config version

    -- vim.cmd[[
    --     autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    --         \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    -- ]]

  -- TODO: Nvim Tree: buffer being swappable
    --  Closes NerdTree tab if its the only remaining tab

    -- NerdTree config versin
    -- vim.cmd[[
    --     autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    -- ]]


    -- TODO: Ignore files

    -- vim.g.NERDTreeIgnore = {'.pyc$', '.pyo$'}

