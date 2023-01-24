
-- Automaticilly runs sync every time this file is saved

-- EVAL: Packer Auto-Sync Function: Packer A little annoying
-- Could be useful once package is more stable
-- not useful if dev is not intending to update yet.
-- Should this config be retained?
  -- Mostly annoying because working on the file alot right now?

-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packer_setup.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- ----------------------------------------------------------------------------
-- Packer Plugin Configurations
-- ----------------------------------------------------------------------------

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- ----------------------------------------------------------------------------
-- Relocate Packer Compiled File
-- ----------------------------------------------------------------------------

  vim.g.packer_compiled_path = '~/.packer_compiled.lua'

-- ----------------------------------------------------------------------------
-- Packer Plugin Start
-- ----------------------------------------------------------------------------

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim';                     -- Packer can manage itself

-- ----------------------------------------------------------------------------
-- LSP, Linter, Dap and Formatters
-- ----------------------------------------------------------------------------

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use    {'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  }

  use    'williamboman/mason-lspconfig.nvim';
  use    'neovim/nvim-lspconfig';                   -- LSP Conigs for better completions
  use    'mfussenegger/nvim-dap';
  use    'mfussenegger/nvim-lint';
  use    'jose-elias-alvarez/null-ls.nvim';
  use    'mhartington/formatter.nvim';
    -- make sure to get nvim-dap-virtual-text


-- ----------------------------------------------------------------------------
-- Splash Screen
-- ----------------------------------------------------------------------------

    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    }

-- ----------------------------------------------------------------------------
-- File Navigation
-- ----------------------------------------------------------------------------

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }


-- ----------------------------------------------------------------------------
-- Key Naviggation
-- ----------------------------------------------------------------------------

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
            prefix = "<leader>"
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    } -- Key Mapping Menu

-- ----------------------------------------------------------------------------
-- Status Bars
-- ----------------------------------------------------------------------------

  -- Tab Bar
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}   --Tab Bar

  -- RESEARCH: Plugin Tab Bar: Find best tab bar solution
  -- Issue with showing all buffers that were opened not just what is currently open
  -- Evaluate barbar features
  -- What works best with color scheme swapping

  -- Shows line changes in sign bar
  use  'mhinz/vim-signify';

  -- Lower Status Line
  -- EVAL: Galexyline Features
  -- Only the default config has been enabled
  -- GOOD: Plugin Galaxy Line: is pretty legit so far -> lacs desired info
  -- Doens't have support for showing full number of lines in a file:
    --  Than could be fixed with custom funciton, but is maybe more work
  -- Some issues with colorscheme

  use({
    "NTBBloodbath/galaxyline.nvim",
    -- your statusline
    -- config = function()
    --   require("galaxyline.themes.eviline")
    -- end,
    -- some optional icons
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })

  -- TODO: Plugin Status Line: Find best status line solution
  -- What works best with color scheem swapping
  -- https://github.com/nvim-lualine/lualine.nvim
  -- https://github.com/feline-nvim/feline.nvim
  -- https://github.com/windwp/windline.nvim
  -- https://github.com/rebelot/heirline.nvim

-- ----------------------------------------------------------------------------
-- Terminal
-- ----------------------------------------------------------------------------

  use    'akinsho/toggleterm.nvim';                   -- Maintains session for :terminal buffer

-- ----------------------------------------------------------------------------
-- Todo Comments
-- ----------------------------------------------------------------------------

  use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end
  }
-- ----------------------------------------------------------------------------
-- Colorscheme
-- ----------------------------------------------------------------------------
  -- TODO: Integrate fave color scheme in to new color plugin
  -- Potential contribution to the the themer repo
  -- Also contribute to updating the main page with appropriate theme list
  use    'fisadev/fisa-vim-colorscheme';             -- Terminal Vim with 256 colors colorscheme


  use({
      "themercorp/themer.lua",
      config = function()
      require("themer").setup({
          -- Light:
          -- colorscheme = "ayu",
          -- colorscheme = "rose_pine_dawn",
          -- colorscheme = "github_light",
          -- colorscheme = "github_light",

          -- Dark:
          -- colorscheme = "amora",  -- Good for not blue tones
          -- colorscheme = "astron", -- Really Good
          -- colorscheme = "ayu_dark",   -- Even Better
          -- colorscheme = "ayu_mirage",
          -- colorscheme = "boo",-- Pretty good - too flat
          -- colorscheme = "catppuccin",
          -- colorscheme = "darknight", -- Good for not blue tones
          -- colorscheme = "doom_one",
          -- colorscheme = "dracula",
          -- colorscheme = "everforest",
          -- colorscheme = "kurai",   -- good
          -- colorscheme = "nord",
          -- colorscheme = "onedark", -- good
          -- colorscheme = "papa_dark",
          -- colorscheme = 'rose_pine',
          -- colorscheme = "rose_pine_moon",
          -- colorscheme = "github_dark", -- Good too grey
          colorscheme = "github_dark_colorblind", -- Contender
          -- colorscheme = "gruvbox-material-dark-hard",
          -- colorscheme = "gruvbox-material-dark-medium", -- Better and gv hard
          -- colorscheme = "gruvbox",

          -- colorscheme = "radium",
          -- colorscheme = "uwu",




          styles = {
              ["function"] = { style = 'italic' },
              functionbuiltin = { style = 'italic' },
	             	variable = { style = 'italic' },
	              	variableBuiltIn = { style = 'italic' },
	            	parameter  = { style = 'italic' },
	          },
            enable_installer = false,
	      }
        )
        end
    })

  -- 'tristen/superman'
  -- 'fcpg/vim-farout';
  -- 'adrian5/oceanic-next-vim';
  -- 'scheakur/vim-scheakur';
  -- 'alessandroyorba/alduin';
  -- 'tomasiser/vim-code-dark;'

-- ----------------------------------------------------------------------------
-- ChatCPT
-- ----------------------------------------------------------------------------

-- EVAL: Plugin ChatGPT: There was more than one version of this plugin
-- Try out the others, but this one looks pretty good

-- GOOD: Plugin ChatGPT: There are severa options to test

-- use({
--   "jackMort/ChatGPT.nvim",
--     config = function()
--       require("chatgpt").setup({
--         -- optional configuration
--       })
--     end,
--     requires = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim"
--     }
-- })



-- ----------------------------------------------------------------------------
-- Feature enhancements
-- ----------------------------------------------------------------------------

  use  'haya14busa/is.vim';                     -- Clears highlights after search is left
  use  'psliwka/vim-smoothie';                  -- Smooths out scrolling
  -- use  'scrooloose/syntastic';                  -- Syntastic - Multi-language error highlighting
  use  'tpope/vim-commentary';                  -- Commentary - Enhanced commenting
  use  'ryanoasis/vim-devicons';                -- File Explorer - Icons by file type - NerdTree
  use  'vim-scripts/IndexedSearch';             -- Displays number of search matches in lower bar
  use  'tpope/vim-fugitive';                    -- Git - interation functionality
  use  'mbbill/undotree';                       -- Shows you undo revisions

  -- BUG: YankRing: Fix automatic mappings overwriting settings
  -- Overrides mapping for Y = yg_ : Yank to end of line
  -- ChatGPT claims this plugin doesn't map anything, but that obviously isn't true
  -- Good plugin tho
  -- use  'vim-scripts/YankRing.vim'               -- Yank history navigation - G2G - Had issue - resolved?
  use  'tpope/vim-surround';                    -- Surround - quick surrond of elements
  use  'godlygeek/tabular';                     -- Aligns text anywhwere in string with regex
  use    'axiaoxin/vim-json-line-format';       -- Pretty Json - Plugin to format <leader>wj
  -- use    'myusuf3/numbers.vim';              -- Numbers   - Toggle for relative numbers <leader>rn
  -- use    'inkarkat/vim-ReplaceWithRegister'; -- Replaces - text with registry content by target
  use    'ThePrimeagen/harpoon';                -- Marks per project - Workflow enhancement
  use  'ntpeters/vim-better-whitespace';        -- Trims whitespace automatically

  -- TODO: Plugin Indent Lines: Plugins conflicts with Splash Page
  -- Figure out indent line situation
  -- Works much better as a plugign but shows lines on splash screend
  -- use    'Yggdroot/indentLine';                      -- Adds visual lines before indents
  -- Doesn't show lines, but doesent' work nearly as well.
	-- use    'lukas-reineke/indent-blankline.nvim';                      -- Adds visual lines before indents

  -- require("indent_blankline").setup {
  --     space_char_blankline = " ",
  --     show_end_of_line = false,
  --     show_current_context = false,
  --     show_trailing_blankline_indent = false,
  -- }


-- ----------------------------------------------------------------------------
-- Validate
-- ----------------------------------------------------------------------------


  -- ACTIVE:   Plugin Autopairs: Validate written in lua
  -- Validate current configuration integrates with treesitter
  -- Closure matching plug wrtten in lua -> uses treesitter to assist prediction
  use 'windwp/nvim-autopairs';                 -- Automatically managges closures

  -- Alternitives
  -- Autoclose will win if its in lua and integration with treesitter works well
  -- use    'Townk/vim-autoclose';                      -- Autoclose
  -- use 'jiangmiao/auto-pairs'                         -- Other version never tested

  -- RESEARCH: Plugin Snippets: Find best snippet solution
  -- 'drmingdrmer/xptemplate'                           -- Autoclose and templates
  -- 'vim-scripts/AutoComplPop';                        -- Other version never tested

-- ----------------------------------------------------------------------------
-- Next man up
-- ----------------------------------------------------------------------------

  -- ACTIVE: Plugin Quick-Scope: Better jump Forward
  -- Integrat this plugin
  -- Quick Ref for f, t / F, T navigation
      --https://github.com/unblevable/quick-scope

  -- ACTIVE: Plugin Targets: Better Surronding Motions
  -- use    'wellle/targets.vim';                   -- Additional motion targes - extends vim core

  -- EVAL: Plugin Indent Jumping: Good for JSON?
  -- Needs good documentation and testing
  -- This could be good for JSON
  -- Not the highest priority
  -- use    'jeetsukumaran/vim-indentwise';     -- Indentation based movements

-- ----------------------------------------------------------------------------
-- To Be Reviewed for Replacement
-- ----------------------------------------------------------------------------
  -- EVAL: Code fromatter: Neoformat
  -- Uses prettier and other popular formatters to format code

  -- EVAL: Next UP Plugins: Potentioall plugin additions
  -- use  'ThePrimeagen/git-worktree.nvim';       -- Marks per project - Workflow enhancement
  -- use  'neomake/neomake';                      -- Async build to run programs - Explore for Go - etc
  -- use  'christoomey/vim-quicklink';            -- Markdown - googles words and grabs links for documentation
  -- use 'akinsho/bufferline.nvim'                -- Navigation enhancement mirroring emacs?

-- ----------------------------------------------------------------------------
-- Python
-- ----------------------------------------------------------------------------
  -- ACTIVE: Plugin Python LSP: Test 'upgrade' to mason lsp over jedi
  -- use 'davidhalter/jedi-vim';                  -- Python
  -- TODO: Isort: Ensure configured properly
  use    'fisadev/vim-isort';                  -- Python - Automatically sort imports
  use 'psf/black'


  -- EVAL: Python Plugin: / more debugging tools

  use {
    "puremourning/vimspector",
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
    config = function()
      require("config.vimspector").setup()
    end,
  }

  -- EVAL: Vimspector: Vimspectorypy -> Does this add any value?
  -- use 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } } " spector dependency

    -- Automatically syncs after initial install
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  -- Semi-advanced configuration options for Packer
  config = {

    -- Enables 'Profile' mode which allows for timing of plugins
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included
    },

    -- Enables floating box display instead of right side buffer
    display = {
      open_fn = function()
      return require('packer.util').float({ border = 'none' })
    end
    }

  }
})

-- ----------------------------------------------------------------------------
-- Troubleshooting
-- ----------------------------------------------------------------------------

-- use 'tpope/vim-scriptease'                        -- Vim Script troubleshooting tools

-- ----------------------------------------------------------------------------
-- Is this needed anymore?
-- ----------------------------------------------------------------------------
  -- CODE SPECIFIC
  -- -------------------------------------

  -- 'ekalinin/Dockerfile.vim';               -- Docker
  -- Plug 'fatih/vim-go',
  -- {'do': 'GoInstallBinaries' }             -- Go
  -- 'valloric/MatchTagAlways';               -- HTML/XML  - Always highlight matching tag
  -- 'martinda/Jenkinsfile-vim-syntax';       -- Jenkins
  -- 'robbles/logstash.vim';                  -- Logstash
  -- 'hashivim/vim-terraform';                -- Terraform
  -- 'yorinasub17/vim-terragrunt';            -- Terragrunt
  -- 'sheerun/vim-polyglot';                  -- 120+ file type syntax highlighting

  -- FEATURES
  -- -------------------------------------
  -- 'vimwiki/vimwiki';                  -- Vimwiki - Imbedded note taking structure
  -- use    'scrooloose/nerdtree';              -- NERDTree - Better file browser





  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
