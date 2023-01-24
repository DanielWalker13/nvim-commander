


-- FIX:  Mason: Json LSP Now Working
-- adding jsonls to the list creates an install error

require("mason").setup {
  PATH = "prepend", -- "skip" seems to cause the spawning error
  log_level = vim.log.levels.DEBUG
}

require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = {
        "bashls", "cssls", "cmake", "dockerls", "esbonio", "glint", "gopls", "grammarly", "html",
        "marksman", "pylsp", "sqls", "sumneko_lua", "terraformls", "tflint", "tsserver", "taplo", "yamlls"
    }
})


--- All Lsp Options: https://github.com/williamboman/mason-lspconfig.nvim

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Problem with mason-lspconfig")
  return
end



local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Problems with lspconfig")
  return
end


-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- NOTE: LSP Key Map: gi is used to go to last
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

end


-- NOTE: From random forum - test

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

mason_lspconfig.setup_handlers {

  function (server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      flags = lsp_flags,
    }
  end,
}



require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 'bash', 'css', 'dot', 'dockerfile', 'gitignore', 'go', 'hcl', 'http', 'json', 'lua', 'make', 'markdown', 'python', 'rego', 'sql', 'toml', 'vim', 'yaml'},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: Rhese are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua ={
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}


    -- {{{ Terraform }}}
        -- require'lspconfig'.terraformls.setup{}
        -- vim.api.nvim_create_autocmd({"BufWritePre"}, {
        --   pattern = {"*.tf", "*.tfvars"},
        --   callback = vim.lsp.buf.formatting_sync,
        -- })



