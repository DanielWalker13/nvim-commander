
-- ----------------------------------------------------------------------------
-- Base Requirements
-- ----------------------------------------------------------------------------

-- Great references for all things nvim
-- https://github.com/rockerBOO/awesome-neovim#statusline
-- https://github.com/nanotee/nvim-lua-guide

require('packer_setup')
require('set')
require('plugin_maps')
require('silent_maps')
require('autocmd')


-- FEATURE: File Indentation: Set different level

-- TODO:  Structure: Migrate current plugin structure to module map

-- TODO: Structure: Fix up format
-- Add good headings


-- TODO: Create Archived
-- New info location for sunsetted configs and pluggin info


-- RESEARCH: Old Autocmds: Are autocmd faster than vim.cmd[[]]
-- Is it worth finding a replacement

-- ----------------------------------------------------------------------------

-- FEATURE: Rezise: This is interesting for resizing panes on close.
-- Looked into it briefly - Looks relevively straight forward
-- https://github.com/kwkarlwang/bufresize.nvim


-- TODO: Plugin Review: Finish reviewing plugins
  -- Indent text object 
  -- accidentially indented who block - not sure if it was this pluging)
  -- 'michaeljsmith/vim-indent-object';

-- FEATURE: Snippet Manager Strategy: Explore best Snippets manager

-- TODO: Plugin Snippes: Create base snippits for python and tf
-- Snippets manager (SnipMate), dependencies, and snippets repo
-- 'MarcWeber/vim-addon-mw-utils';
-- Started causeing issuew with tab from insert mode
-- 'honza/vim-snippets';
-- 'garbas/vim-snipmate';


-- RESEARCH: Unknown: Testing for compatibility with predictions workflow
-- Danny disabled
-- set completeopt-=preview
-- set completeopt-=menu

