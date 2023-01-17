
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    enable_check_bracket_line = true,
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
-- RESEARCH: What does this do?
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

-- EVAL: Additional Features
-- There are a few additional features at the bottom of the readme
-- Test them out one back to writing python code



-- TODO: Assess best approach to Autoclosing brakets (and snippets)
-- I think nvim auto pairs is good
-- Validat and delete notes below

-- ----------------------------------------------------------------------------
-- General Mappings
-- ----------------------------------------------------------------------------

    --  Fix to let ESC work as expected with Autoclose plugin
    -- let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

    -- Fix to let ESC work as espected with Autoclose plugin
    -- let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

    -- let g:AutoCloseProtectedRegions = ["Character"]
    -- Disables auto complete for quotes
    -- let g:AutoClosePairs_del = "'"
    -- let g:AutoClosePairs_del = '"'


    -- RESEARCH: Learn more about templates - supports closures
    -- XTEMPLATE ------------------------------
    -- Sets xtemp key - Probabaly not needed
    -- let g:xptemplate_key = '<Tab>'
    -- let g:xptemplate_brace_complete = "([{'"


    -- TOOD: Figure out hour to make it line break and insert with correct tabbing
    -- if after function definition
    -- inoremap " ""<left>
    -- inoremap ' ''<left>
    -- inoremap ( ()<left>
    -- inoremap [ []<left>
    -- inoremap { {}<left>
    -- inoremap {<CR> {<CR>}<ESC>O
    -- inoremap {;<CR> {<CR>};<ESC>O
