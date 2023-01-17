# Danny's Nvim Conf

# Pluggin list 

## Package Management 

- Packer

## LSP 

- Treesiter
- Mason 
    + Dependencies 
        * Mason-LspConfig
        * nvim-lspConfig
        * nvim-dap
        * nvim-lint
        * null-ls.nvim
        * formatter.nvim

## Passive Features 

- FixedTaskList
    + Pending tasks list; TODO, FIXME, XXX, and custom
    + TODO: Title hihglighting doesn't work with treesitter
        * Is there a better solutin 
        * Can I update packaeg to support this functionallity

- is: Incramental Search 
    + Clears search highlihgting after you leaver 
    + Works, but higghlighting doesn't quit work as cleanly as i'd like
    + TODO: Research enhancements 

- vim-smoothie
    + Smooths out scrolling
        * Is this needed - I don't use mouse

- Syntactic 
    + Why am I still using this? 
    + Shouldn't the new LSP confis cover everything that is being done 

- vim-commentary'
    + Enhanced commenting

- vim-airline'
    + Airline - Lower status bar

- vim-airline-themes'
    + Themes

- vim-devicons
    + Icons for NerdTree

- IndexedSearch'
    + Displays number of search matches in lower bar

- indentLine'
    + Adds visual lines before indents

- vim-autoclose
    - Closes enclosures automatically


## Active Features

- toggleterm.nvim'
    + Terminal session in nvim buffer
-  vim-ReplaceWithRegister'
    + text with registry content by target
- numbers.vim'
    +  Toggle for relative numbers 
    + <leader>rn
- nerdtree
    + Directiory naviggation/ management 
    + TODO: Try out nvim-tree
- vim-surround
    + Key maps to surround objects with enclosures
- godlygeek/tabular'
    + Aligns text anywhwere in string with regex
    + TODO: Revisit and document
- vim-fugitive
    + Git
    + Interation functionality

### Nvim Only

- plenary.nvim'
    + Lua - Helper functions (Required by for Harpoon)
- harpoon 
    + Marks per project 
    + Workflow enhancement
- git-worktree
    + TODO: What is it? 
- telescope
    + Better Fuzzy Finder for nvim

    -- TODO: Is this the syntax solution?
    -- NVIM based syntax highlighteing, indent awareness and more



## Under Review 

- wellle/targets.vim 
    + Additional motion targets 



