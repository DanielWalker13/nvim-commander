

  -- TODO: Ensure unwanted commands don't show up in which key
  -- for y,v,d -> Move might be to disable then in config and make equivelent of \<space> to show it manually

vim.keymap.set('n', '<leader><space>', ':WhichKey <leader><CR>', { desc = 'Which Key: Immediately Open' })

    -- vim.keymap.set('n', '<leader><space>', ':WhichKey <leader><CR>', { desc = 'Which Key Leader Menu' })

local wk = require("which-key")

local opts = { prefix = "<leader>" }

local mappings = {
  f = {
    name = "Find: Telescope", -- optional group name
    -- b = {'<cmd>Telescope buffers<cr>', 'Search Buffers'},
    b = {'<cmd>Telescope file_browser<cr>', 'Search Buffers'},
    d = {'<cmd>Telescope spell_suggest<cr>', 'Seach Dictionary'},
    f = {'<cmd>Telescope find_files<cr>', "Seearh Files: Current Dir" },
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
    g = {
        name = "Git",
        -- Branch: checkout action <cr>, track action <C-t> and rebase action<C-r>
        b = {'<cmd>Telescope git_branches <cr>', 'Lists all branches '},
        c = {'<cmd>Telescope git_commits <cr>', 'Lists Git Commits'},
        -- Buffer: checks them out on <cr>
        d = {'<cmd>Telescope git_bcommits <cr>', 'Current Buffer Commits'},
        f = {'<cmd>Telescope git_files<cr>', 'Search Git Files'},

        g = {':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Find in Project > ")})<Cr>', 'List Stach'},
        h = {'<cmd>Telescope git_stash <cr>', 'List Stach'},
        --  Status: Checkout action <cr>,
        --  Status: Reset mixed <C-r>m, soft <C-r>s, hard <C-r>h
        s = {'<cmd>Telescope git_status	<cr>', 'Git Status'},

    },
    h = {'<cmd>Telescope help_tags<cr>', 'Seach Help'},
    k = {'<cmd>Telescope keymaps<cr>', 'Seach Key Maps'},
    l = {
        name = "LSP",
        b = {'<cmd>Telescope lsp_document_symbols <cr>', 'LSP document symbolsin the current buffer'},
        d = {'<cmd>Telescope lsp_definitions <cr>', 'Go to Definition'},
        i = {'<cmd>Telescope lsp_incoming_calls <cr>', 'LSP incoming calls for current word'},
        o = {'<cmd>Telescope lsp_outgoing_calls <cr>', 'LSP outgoing calls for current word '},
        r = {'<cmd>Telescope lsp_references <cr>', 'LSP references for current word'},
        s = {'<cmd>Telescope lsp_implementations <cr>', 'Go to Source'},
        t = {'<cmd>Telescope lsp_type_definitions <cr>', 'Go to Type Definition'},
        w= {'<cmd>Telescope lsp_workspace_symbols <cr>', 'LSP document symbols in the current workspace'},

    },
    m = {'<cmd>Telescope man_pages <cr>', 'Seach Man Pages'},
    o = {'<cmd>Telescope vim_options <cr>', 'Seach Vim Options'},
    q = {'<cmd>Telescope quickfix <cr>', 'Seach Quick Fix'},



    r = {'<cmd>Telescope registers <cr>', 'Seach Registers'},
    s = {'<cmd>Telescope live_grep <cr>', 'Rip Grep' },
    -- t = {'<cmd>TodoTelescope <cr>', 'Treesitter: Lists Function names, variables'},
    t = {
      name = 'Task Lists',

    -- TODO: add todo vim conf fix list?
    -- Specific dire can be references for todo context
    -- :TodoTrouble cwd=~/projects/foobar

      l = {
        name = 'List version',
        f = {'<cmd>TodoLocList keywords=FIX,FIXME,BUG,FIXIT,ISSUE,TODO,UPGRADE,RESEARCH,OPTIM,PERFORMANCE,OPTIMIZE,DOCUMENT<cr>', 'Todo Fix Me Tags' },
        i = {'<cmd>TodoLocList keywords=INFO, NOTE<cr>', 'Todo Info Tags' },
        r = {'<cmd>TodoLocList keywords=RESEARCH,OPTION,GOOD,OK,BEST<cr>', 'Todo Research Tags' },
        t = {'<cmd>TodoLocList keywords=TEST,TESTING,PASSED,FAILED<cr>', 'Todo Testing Tags' },
      },

      t = {
        name = 'Telescope version',
        f = {'<cmd>TodoTelescope keywords=FIX,FIXME,BUG,FIXIT,ISSUE,TODO,UPGRADE,RESEARCH,OPTIM,PERFORMANCE,OPTIMIZE,DOCUMENT,TEST<cr>', 'Todo Fix Me Tags' },
        i = {'<cmd>TodoTelescope keywords=INFO,NOTE<cr>', 'Todo Info Tags' },
        r = {'<cmd>TodoTelescope keywords=RESEARCH,OPTION,GOOD,OK,BEST<cr>', 'Todo Research Tags' },
        t = {'<cmd>TodoTelescope keywords=TEST,TESTING,PASSED,FAILED<cr>', 'Todo Testing Tags' },
      },
    }



  },

  g = {
    name = "Git: Fugitive",

    a = {':Gwrite<CR>', 'Git Add' },                           -- tested
    b = {
        name = 'Git Branch',
        b = {':Git branch<CR>', 'Check Local Branch' }, -- tested
        c = {':Git blame<CR>', 'Blame: Changes Line by Line' }, -- tested
        r = {':Git branch -a<CR>', 'Check Remote Branches' }, -- tested
    },

    c = {':Git commit<CR>', 'Git Commit' }, -- tested
    d = {':Gvdiff <CR>', 'Git Diff' },      -- tested

    f = {':Git fetch<CR>', 'Git Fetch' },
    -- g = {'', '' },
    i = {':Git pull<CR>', 'Git Pull' },
    l = {
        name = 'Git Log',
        c = {':Gclog<CR>', 'Git Commit Log' }, -- tested
        l = {':Git log<CR>', 'Git Log' },      -- tested
    },
    o = {':Git checkout', 'Git Diff' },      -- tested
    m = {':Git merge', 'Git Merge' },

    s = {':Git<CR>', 'Git Status' },    -- tested
    p = {':Git push<CR>', 'Git push' }, -- tested

    -- TODO: GIT Feature: How to push branch to origin - first push
    -- o = {':silent exec "Git push origin " . fugitive#head()<CR><CR>', 'Git Push Origin' },
  },
  h = {
    name = 'Harpoon: Workspace Management',
    a = {':lua require("harpoon.mark").add_file() <CR>',  'Add file' },
    m = {':lua require("harpoon.ui").toggle_quick_menu() <CR>',  'Menu' },
    -- m = {':Telescope harpoon marks<CR>',  'Menu' },
    n = {':lua require("harpoon.ui").nav_next() <CR>',  'Next buffer' },
    p = {':lua require("harpoon.ui").nav_prev() <CR>',  'Previous Buffer' },
    j = {':lua require("harpoon.ui").nav_file(1) <CR>', 'Secect 1st buffer' },
    k = {':lua require("harpoon.ui").nav_file(2) <CR>', 'Secect 2st buffer' },
    l = {':lua require("harpoon.ui").nav_file(3) <CR>', 'Secect 3st buffer' },
    [";"] = {':lua require("harpoon.ui").nav_file(4) <CR>', 'Secect 4st buffer' },
  },
  m = {
    name = 'General Maps',


    c = {':nohl<CR><C-l>', 'Clear Highlighing' },
    l = {
      name = 'Line Edits',
      d = {'_DjA <ESC>pkdd', 'Pastes current line at the end of next' },
      e  = {'A <ESC>p', 'Paste yanked string at end of the line'}
    },
    r = {':NumbersToggle<CR>', 'Toggles Relitive numbers'},
    s = {':.! open "http://google.com/search?q="<left>', 'Gooogle Search Hack'},
  },
  n = {':NvimTreeToggle<CR>', 'NerdTree: Togggle Sidebar'},

  p = {
    name = 'Plugin Mappings',
    a = {':Tabularize /', 'Aligns blocks by character'},
    b = {':Black<CR>', 'Black: Python Linter'},
    c = {
      name = 'ChatGPT: AI Suggestions',
      c = {':ChatGPT<CR>', 'Opens ChatGPT Window'},
      i = {':ChatGPTEditWithInstructions<CR>', 'Opens ChatGPT Window with Instructions'},
    },
    u = {':UndotreeToggle<CR>', 'UndoTree Toggle'},
    s = {
      name = 'Signify: Change blocks in sign column',
      n = {'<plug>(signify-next-hunk)', 'Jump to next changed blocks'},
      p = {'<plug>(signify-prev-hunk)', 'Jump to previous changed blocks'},
    },
    y = {':silent YRShow<CR>', 'Yank Ring: Toggle' }
  },

-- {{{ Split Navigation }}}
  -- EVAL: Split Bindings
  -- These bindings vs TABTAB features
  -- Should I introduce horozontal splits
  -- Is there a plugin for reorganizing split buffers like tmux has

-- " nmap <leader>sp <plug>(signify-prev-hunk)
  s = {
    name = 'Splits',
    n = {':vsp',   'New Split' },
    k = {'<C-W>k', 'Split Nav Up' },
    j = {'<C-W>j', 'Split Nav Down' },
    h = {'<C-W>h', 'Split Nav Left' },
    l = {'<C-W>l', 'Split Nav Right' },
  },

-- {{{ Tab Navigation }}}
  t = {
    name = 'Tabs',
    n = {':tabnew', 'New Tab'},
    h = {':tabp<CR>', 'Previous Tab Nav' },
    l = {':tabn<CR>',  'Next Tab Nav' },
    m = {
      name = 'Move Tab Position',
      h = {':tabm -1<CR>', 'Move Tab Left'  },
      l = {':tabm +1<CR>', 'Move Tab Right' },
      e = {':tabm<CR>', 'Move tab to end position' },
      f = {':tabm 0<CR>', 'Move tab to first postition' },
    }
  },
  v = {
    name = "Vimspector",
    G = { "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>", "Generate Debug Profile" },
    I = { "<cmd>VimspectorInstall<cr>", "Install" },
    U = { "<cmd>VimspectorUpdate<cr>", "Update" },
    R = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor" },
    c = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
    i = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
    o = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
    s = { "<cmd>call vimspector#Launch()<cr>", "Start" },
    t = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
    u = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
    S = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
    r = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
    x = { "<cmd>VimspectorReset<cr>", "Reset" },
    H = { "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>", "Toggle HUMAN mode" },
  }
}

-- UPGRADE: Python Map: Automatic current file execution
-- This worked pretty good but had a small window and a couple other issues
-- Looking to enhance to use ToggleTerm Maybe?
-- Runs current python file
-- vim.keymap.set('n', '<leader>xx',  ":w<CR>:terminal system('python1 "' . expand('%') . '"')<cr>")


-- TODO: Investigte if recreation of any of these Git vimscript functions is worth recreating


-- silent exec "Git push origin " . lua vim.cmd[[ fugitive#head()]]
        -- " nmap <leader>sp <plug>(signify-prev-hunk)

-- " Fugitive Functions in autoload/functions.vim
-- function! s:GitShortRefNames(names, full_name) "{{{2
--   if a:full_name
--     let expr = 'v:val[11:]'
--   else
--     let expr = 'v:val[strridx(v:val, "/")+1:]'
--   endif
--   return map(a:names, expr)
-- endfunction


-- function! s:GitExecInPath(cmd) "{{{2
--   if exists('b:git_dir')
--     let path = b:git_dir
--   else
--     let path = fugitive#extract_git_dir('.')
--   endif
--   let path = fnamemodify(path, ':h')

--   return system('cd ' . path . '; ' . a:cmd)
-- endfunction

-- function! s:GitComplete(ArgLead, Cmdline, Cursor, ...) "{{{2
--   let refs = 'refs/heads/'
--   if a:0 == 1 && a:1 !=? 'branch'
--     let refs = 'refs/' . a:1
--     let full_name = 1
--   elseif a:0 == 2 && a:1 ==? 'branch'
--     let refs = refs . a:2
--     let full_name = 0
--   endif

--   let cmd = 'git for-each-ref --format="%(refname)" ' . refs
--   if !empty(a:ArgLead)
--     let cmd = cmd . ' | sed "s/.*\/\(.*\)/\1/" | grep ^' . a:ArgLead . ' 2>/dev/null'
--   endif
--   return s:GitShortRefNames(split(s:GitExecInPath(cmd)), full_name)
-- endfunction

-- function! s:GitExtraComplete(ArgLead, CmdLine, Cursor, type) "{{{2
--   if (empty(a:ArgLead) || a:ArgLead =~? '^f\%[inish]$') && a:CmdLine !~? 'finish\s*$'
--     return ['finish']
--   else
--     return s:GitComplete(a:ArgLead, a:CmdLine, a:Cursor, 'branch', a:type)
--   endif
-- endfunction

-- function! functions#GitBugComplete(ArgLead, CmdLine, Cursor) "{{{2
--   return s:GitExtraComplete(a:ArgLead, a:CmdLine, a:Cursor, 'bug')
-- endfunction

-- function! functions#GitFeatureComplete(ArgLead, CmdLine, Cursor) "{{{2
--   return s:GitExtraComplete(a:ArgLead, a:CmdLine, a:Cursor, 'feature')
-- endfunction

-- function! functions#GitRefactorComplete(ArgLead, CmdLine, Cursor) "{{{2
--   return s:GitExtraComplete(a:ArgLead, a:CmdLine, a:Cursor, 'refactor')
-- endfunction


wk.register(mappings, opts)

-- -- Unused mapping optinos
-- --     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
-- --     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!

