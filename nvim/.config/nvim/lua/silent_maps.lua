-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Silent Mappings
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local map = require("utils").map

  -- TODO: Test that all of these are working
  -- FIX: Y - not working

  map( 'n', 'Y', 'yg_', { desc = 'Y yanks to end of line' })
  map( 'n', 'n', 'nzz', { desc = 'Remaps next motions to center to screen' })
  map( 'n', 'N',  'Nzz', { desc = 'Remaps next motions to center to screen' })
  map( 'n', 'g;',  'g;zz', { desc = 'Remaps last edit motions to center to screen' })
  map( 'n', 'k', 'gk', { desc = 'Motion works with wrap on seperate line' })
  map( 'n', 'gk', 'k', { desc = 'Motion works with wrap on seperate line' })
  map( 'n', 'j', 'gj', { desc = 'Motion works with wrap on seperate line' })
  map( 'n', 'gj', 'j', { desc = 'Motion works with wrap on seperate line' })


  -- TODO: Additional testing to ensure this is working properly
  -- Remaps class definition jumps to class and function for python
  -- autocmd FileType python nnoremap <buffer> [[ ?^class\\|^\s*def<CR>
  -- autocmd FileType python nnoremap <buffer> ]] /^class\\|^\s*def<CR>
  -- autocmd FileType python nnoremap <buffer> [[ ?^\s*\zs\<class\>\\|^\s*\zs\<def\><CR>
  -- autocmd FileType python nnoremap <buffer> ]] /^\s*\zs\<class\>\\|^\s*\zs\<def\><CR>



