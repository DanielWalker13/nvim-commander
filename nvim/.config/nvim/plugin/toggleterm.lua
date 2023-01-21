-- ----------------------------------------------------------------------------
-- ToggleTerm
-- ----------------------------------------------------------------------------

    require("toggleterm").setup{
        direction = "horizontal",
        size = function(term)
          if term.direction == "horizontal" then
            return vim.o.lines * 0.5
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1",
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        -- direction = 'float',
        close_on_exit = true,
        float_opts = {
          border = "rounded",
          width = math.floor(vim.o.columns * 0.85),
          height = math.floor(vim.o.lines * 0.8),
          winblend = 15,
          highlights = { border = "Normal", background = "Normal" },
        },
    }


    vim.g.toggleterm_init_cmd = 'source ~/.zprofile'

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}

      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)        -- Exit Terminal Mode
      -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    -- local lazygit = Terminal:new({ cmd = "lazygit", count = 5 })

    -- {{{ Lazy Git }}}

    -- local Terminal  = require('toggleterm.terminal').Terminal
    -- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    -- function _lazygit_toggle()
    --   lazygit:toggle()
    -- end

    -- vim.api.nvim_set_keymap("n", "<leader>lt", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


