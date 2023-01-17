

-- {{{ Todo Comment }}}

-- Todo Actions: Navigate previous / next 
vim.keymap.set('n', ']f', function()
  require('todo-comments').jump_next({keywords = { 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'TODO', 'UPGRADE', 'RESEARCH', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE', 'DOCUMENT', 'TEST'}})

end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[f', function()
  require('todo-comments').jump_prev({keywords = { 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'TODO', 'UPGRADE', 'RESEARCH', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE', 'DOCUMENT', 'TEST'}})
end, { desc = 'Previous todo comment' })

-- Todo Info: Navigate previous / next 
vim.keymap.set('n', ']i', function()
  require('todo-comments').jump_next({keywords = {'INFO', 'NOTE'}})
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[i', function()
  require('todo-comments').jump_prev({keywords = {'INFO', 'NOTE'}})
end, { desc = 'Previous todo comment' })

-- Todo Research: Naviggate previous / next 
vim.keymap.set('n', ']r', function()
  require('todo-comments').jump_next({keywords = {'RESEARCH', 'OPTION', 'GOOD', 'OK', 'BEST'}})
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[r', function()
  require('todo-comments').jump_prev({keywords = {'RESEARCH','OPTION', 'GOOD', 'OK', 'BEST'}})
end, { desc = 'Previous todo comment' })

-- Todo Testing: Naviggate previous / next 
vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next({keywords = {'TEST', 'TESTING', 'PASSED', 'FAILED'}})
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev({keywords = {'TEST', 'TESTING', 'PASSED', 'FAILED'}})
end, { desc = 'Previous todo comment' })




