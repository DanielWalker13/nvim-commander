-- ----------------------------------------------------------------------------
-- Vim Spector Mappings
-- ----------------------------------------------------------------------------
    -- {{{ Reviewed }}}
    -- NOTE: Vimspector 'Human' config shouldn't be needed -> which key maps
    -- vim.g.vimspector_enable_mappings = 'HUMAN' -- Sets default key bindings

        -- vim.keymap.set('n', '<leader>dd', ':call vimspector#Launch()<CR>')
        -- vim.keymap.set('n', '<leader>dr', ':call vimspector#Reset()<CR>')
        -- vim.keymap.set('n', '<leader>dc', ':call vimspector#Continue()<CR>')

        -- vim.keymap.set('n', '<leader>dt', ':call vimspector#ToggleBreakpoint()<CR>')
        -- vim.keymap.set('n', '<leader>dT', ':call vimspector#ClearBreakpoints()<CR>')

        -- vim.keymap.set('n', '<leader>dk', '<Plug>VimspectorRestart')
        -- vim.keymap.set('n', '<leader>dh', '<Plug>VimspectorStepOut')
        -- vim.keymap.set('n', '<leader>dl', '<Plug>VimspectorStepInto')
        -- vim.keymap.set('n', '<leader>dj', '<Plug>VimspectorStepOver')

    -- {{{ To Be Reviewed }}}


local M = {}

-- local utils = require "utils"

local vimspector_python = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "debugpy",
      "configuration": {
        "name": "Python: Launch",
        "type": "python",
        "request": "launch",
        "python": "%s",
        "stopOnEntry": true,
        "console": "externalTerminal",
        "debugOptions": [],
        "program": "${file}"
      }
    }
  }
}
]]

local function debuggers()
  vim.g.vimspector_install_gadgets = {
    "debugpy", -- Python
  }
end

--- Generate debug profile. Currently for Python only
function M.generate_debug_profile()
  -- Get current file type
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  if ft == "python" then
    -- Get Python path
    local python3 = vim.fn.exepath "python"
    local debugProfile = string.format(vimspector_python, python3)

    -- Generate debug profile in a new window
    vim.api.nvim_exec("vsp", true)
    local win = vim.api.nvim_get_current_win()
    local bufNew = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
    vim.api.nvim_win_set_buf(win, bufNew)

    local lines = {}
    for s in debugProfile:gmatch "[^\r\n]+" do
      table.insert(lines, s)
    end
    vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)
  else
    vim.notify("Unsupported language - " .. ft, "Generate Debug Profile")
  end
end

function M.toggle_human_mode()
  if vim.g.vimspector_enable_mappings == nil then
    vim.g.vimspector_enable_mappings = "HUMAN"
    vim.notify("Enabled HUMAN mappings", "Debug")
  else
    vim.g.vimspector_enable_mappings = nil
    vim.notify("Disabled HUMAN mappings", "Debug")
  end
end

function M.setup()
  vim.cmd [[packadd! vimspector]] -- Load vimspector
  debuggers() -- Configure debuggers
end

return M
