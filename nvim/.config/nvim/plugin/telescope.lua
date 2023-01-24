
-- EVAL: Should I add grep string to telescopr mappings
-- nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Find in Project > ")})<C


  -- vim.g.telescope_auto_insert = 0
  -- vim.g.telescope.defaults.sorting_strategy = "ascending"

  -- telescope.defaults.initial_mode

-- require("telescope").load_extension('harpoon')
-- require("themer").setup({ enable_installer = true })
    require('telescope').setup{
      defaults = {

        -- Default configuration for telescope goes here:
        -- config_key = value,

        -- set_env = { COLORTERM = "truecolor" }
        vimgrep_arguments = {
            "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = 'normal',
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      -- pickers = {
      --   -- Default configuration for builtin pickers goes here:
      --   -- picker_name = {
      --   --   picker_config_key = value,
      --   --   ...
      --   -- }
      --   -- Now the picker_config_key will be applied every time you call this
      --   -- builtin picker
      -- },
      extensions = {
        -- Your extension configuration goes here:
    -- extensions_list = { "themes", "terms" },
        extension_name = {
          extension_config_key = 'harpoon',
        }
        -- please take a look at the readme of the extension you want to configure
      }
    }


-- Pmenu – normal item
-- PmenuSel – selected item
-- PmenuSbar – scrollbar
-- PmenuThumb – thumb of the scrollbar

    -- autocmd ColorScheme * highlight Pmenu ctermbg=234
-- highlight PmenuSel ctermbg=red
-- highlight PmenuThumb ctermbg=red guibg=#FFFFFF

-- PmenuThumb – thumb of the scrollbar





-- UPGRADE:
-- URL: https://github.com/ThemerCorp/themer.lua
-- Investigate upgrade -> Confg from Base46 (nvChat) version

-- local present, telescope = pcall(require, "telescope")

-- if not present then
--   return
-- end

-- vim.g.theme_switcher_loaded = true

-- require("base46").load_highlight "telescope"

-- local options = {
--   defaults = {
--     vimgrep_arguments = {
--       "rg",
--       "-L",
--       "--color=never",
--       "--no-heading",
--       "--with-filename",
--       "--line-number",
--       "--column",
--       "--smart-case",
--     },
--     prompt_prefix = "   ",
--     selection_caret = "  ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "ascending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       horizontal = {
--         prompt_position = "top",
--         preview_width = 0.55,
--         results_width = 0.8,
--       },
--       vertical = {
--         mirror = false,
--       },
--       width = 0.87,
--       height = 0.80,
--       preview_cutoff = 120,
--     },
--     file_sorter = require("telescope.sorters").get_fuzzy_file,
--     file_ignore_patterns = { "node_modules" },
--     generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--     path_display = { "truncate" },
--     winblend = 0,
--     border = {},
--     borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--     color_devicons = true,
--     set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
--     mappings = {
--       n = { ["q"] = require("telescope.actions").close },
--     },
--   },

--   extensions_list = { "themes", "terms" },
-- }

-- -- check for any override
-- options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
-- telescope.setup(options)

-- -- load extensions
-- pcall(function()
--   for _, ext in ipairs(options.extensions_list) do
--     telescope.load_extension(ext)
--   end
-- end)
