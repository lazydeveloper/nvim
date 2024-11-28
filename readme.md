### nvim-cheetsheet
#### Compile Java code

    `:!javac %` to compile and `!java` to run it 
    Additionally there can also be keymapped in `init.lua` file
        
#### Split Screen

    :split (horizontal split)
    :vsplit (vertical split

#### Terminal

    :term (open terminal in full screen)
    :botright term (open terminal in bottom of the screen)
    :split | term (open terminal in botton of the screen)
    :vsplit | term (open terminal in right split) 

### to-do settings

    :tabs               - opens all open tabs 
    :tabnew             - this can be done using command :tabnew
    :tabnew filename  - open file in the new tab
    :tabnext 
    :tabnew filename
    :tabprev
    :tabfirst 
    :tablast
    :gt (next tab) and Gt(previous tab)

    :tabclose to close the current tab
    :tabonly to close all tabs except the current one.

#### Search 
     
    - exist the insert mode and then hit `/` to enter search
    - :nohlsearch to clear the search results


#### File Explorer

    - Tried and uninstalled nvim.tree (not a minimal one)
    - Installed oil, here are the settings
        
#### Select multiple file at once.

    - Hit V for visual mode - in visual mode use the keys `j` `k` `l` `h` to navigate and hit `y` to copy
    - this can only be enabled only when configured in `init.lua`
    - Here is the cmd
        `vim.opt.clipboard:append("unnamedplus") 

### How to select multiple file to delete

    [ ] How to manage terminal with in neovim
    [ ] How to copy text to system clipboard
    `opt.clipboard:append("unnamedplus")` is't working for me

